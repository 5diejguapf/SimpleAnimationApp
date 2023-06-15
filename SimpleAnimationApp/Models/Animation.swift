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
    
    var description: String {
        """
        Animation Info
        name: \(animation)
        curve: \(curve)
        delay: \(delay.formatted())
        duration: \(duration.formatted())
        force: \(force.formatted())
        """
    }
    
    static func getRandomAniation() -> Animation {
        Animation(
            animation: DataStore.shared.animations.randomElement()?.rawValue ?? "slideLeft",
            curve: DataStore.shared.curves.randomElement()?.rawValue ?? "easeIn",
            delay: Double.random(in: 0.1...1.5),
            duration: Double.random(in: 0.1...1.5),
            force: Double.random(in: 0.1...1.5)
        )
    }
}
