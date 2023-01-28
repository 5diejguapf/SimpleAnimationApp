//
//  ViewController.swift
//  SimpleAnimationApp
//
//  Created by serg on 26.01.2023.
//

import UIKit
import SpringAnimation

final class ViewController: UIViewController {

    @IBOutlet weak var animatedView: SpringView!
    @IBOutlet weak var animationInfo: UILabel!
    @IBOutlet weak var animationButton: UIButton!
    
    private var generator = AnimationGenerator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animatedView.layer.cornerRadius = 10
        
        animationButton.setTitle(generator.currentAnimation?.animation ?? "", for: .normal)
    }

    @IBAction func startAnimationAction() {
        guard let animation = generator.currentAnimation else { return }
        
        setAnimateParams(animation: animation)
        setLabelInfo(animation: animation)
        
        animatedView.animate()
            
        animationButton.setTitle(generator.nextAnimationName(), for: .normal)
    }
    
}

extension ViewController {
    private func setAnimateParams(animation: Animation) {
        animatedView.animation = animation.animation
        animatedView.delay = animation.delay
        animatedView.duration = animation.duration
        animatedView.force = animation.force
        animatedView.curve = animation.curve
    }
    
    private func setLabelInfo(animation: Animation) {
        animationInfo.text = """
            Animation Info
            name: \(animation.animation)
            curve: \(animation.curve)
            delay: \(animation.delay.formatted())
            duration: \(animation.duration.formatted())
            force: \(animation.force.formatted())
            """
        animationInfo.numberOfLines = animationInfo.text?.split(separator: "\n").count ?? 3
    }
    
}

