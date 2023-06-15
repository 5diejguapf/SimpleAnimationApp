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
    
    private var animation = Animation.getRandomAniation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animatedView.layer.cornerRadius = 10
        
        animationButton.setTitle(animation.animation, for: .normal)
    }

    @IBAction func startAnimationAction() {
        setAnimateParams(animation: animation)
        setLabelInfo(animation: animation)
        
        animatedView.animate()
        
        animation = Animation.getRandomAniation()
            
        animationButton.setTitle("Run \(animation.animation)", for: .normal)
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
        animationInfo.text = animation.description
        animationInfo.numberOfLines = animationInfo.text?.split(separator: "\n").count ?? 3
    }
    
}

