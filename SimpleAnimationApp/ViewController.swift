//
//  ViewController.swift
//  SimpleAnimationApp
//
//  Created by serg on 26.01.2023.
//

import UIKit
import SpringAnimation

class ViewController: UIViewController {

    @IBOutlet weak var animatedView: SpringView!
    @IBOutlet weak var animationInfo: UILabel!
    
    @IBOutlet weak var btn: UIButton!
    
    private let animations: [AnimationPreset] = AnimationPreset.allCases
    private var currentAnimationIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animatedView.layer.cornerRadius = 10
        setButtonName(index: currentAnimationIndex)
    }

    @IBAction func startAnimationAction() {
        guard let aniname = btn.currentTitle else { return }
        
        setAnimateParams(animation: aniname)
        setLabelInfo()
        
        animatedView.animate()
        
        currentAnimationIndex += 1
        if currentAnimationIndex == animations.count {
            currentAnimationIndex = 0
        }
        
        setButtonName(index: currentAnimationIndex)
    }
    
    private func setAnimateParams(animation: String) {
        animatedView.animation = animation
        animatedView.delay = Double.random(in: 0.1...1.5)
        animatedView.duration = Double.random(in: 0.1...1.5)
        animatedView.force = Double.random(in: 0.1...1.5)
        animatedView.curve = AnimationCurve.allCases.randomElement()?.rawValue ?? AnimationCurve.easeIn.rawValue
    }
    
    private func setLabelInfo() {
        animationInfo.text = """
            Animation Info
            name: \(animatedView.animation)
            curve: \(animatedView.curve)
            delay: \(animatedView.delay.formatted())
            duration: \(animatedView.duration.formatted())
            force: \(animatedView.force.formatted())
            """
        animationInfo.numberOfLines = animationInfo.text?.split(separator: "\n").count ?? 3
    }
    
    private func setButtonName(index: Int) {
        let nextAniName = getAnimationNameBy(index: index) ?? ""
        btn.setTitle(nextAniName, for: .normal)
        
    }
    
    private func getAnimationNameBy(index: Int) -> String? {
        if !animations.indices.contains(index) {
            return nil
        } else {
            return animations[index].rawValue
        }
    }
    
}

