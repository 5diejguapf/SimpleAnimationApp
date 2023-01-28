//
//  Animation.swift
//  SimpleAnimationApp
//
//  Created by serg on 28.01.2023.
//

import SpringAnimation

struct Animation {
    let animation: String
    let curve: String
    let delay: Double
    let duration: Double
    let force: Double
    
    init(animation: AnimationPreset, curve: AnimationCurve) {
        self.animation = animation.rawValue
        self.curve = curve.rawValue
        self.delay = Double.random(in: 0.1...1.5)
        self.duration = Double.random(in: 0.1...1.5)
        self.force = Double.random(in: 0.1...1.5)
    }
}

struct AnimationGenerator {
    
    var currentAnimation: Animation? {
        if !animations.indices.contains(animationIndex) {
            return nil
        }
        guard let curve = curves.randomElement() else { return nil }
        return Animation(animation: animations[animationIndex], curve: curve)
    }
    
    private var animationIndex = 0
    private let animations = AnimationPreset.allCases
    private let curves = AnimationCurve.allCases
    
    mutating func nextAnimationName() -> String {
        animationIndex += 1
        
        if !animations.indices.contains(animationIndex) {
            animationIndex = 0
        }
        return animations[animationIndex].rawValue
    }
    
}
