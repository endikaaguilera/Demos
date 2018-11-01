//
//  AppExtensions.swift
//  Demos
//
//  Created by ThisObey Studio on 1/11/18.
//  Copyright © 2018 ThisObey Studio. All rights reserved.
//

import UIKit

private let cli: CustomLoadingIndicator = CustomLoadingIndicator()

extension UIView {

    func showLoadingIndicator() {
        cli.show(parentView: self)
    }
    
    func hideLoadingIndicator() {
        cli.hide()
    }
    
    func hideLoadingIndicator(success: Bool) {
        cli.hide(success: success)
    }

}

extension UIImageView {
    
    func setImageColor(color: UIColor) {
        self.image? = self.image!.makeTintable()
        self.tintColor = color
    }
    
}

extension UIImage {
    func makeTintable() -> UIImage {
        return withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
    }
}

// Call this Function only, access from any where in your project

// Default Animations values
private let animationDuration: TimeInterval = 1.0
private let deleyTime: TimeInterval = 0
private let springDamping: CGFloat = 0.25
private let lowSpringDamping: CGFloat = 0.50
private let springVelocity: CGFloat = 8.00

extension CustomView {
    
    // MARK:- Default Animation
    public func AnimateView(){
        provideAnimation(animationDuration: animationDuration, deleyTime: deleyTime, springDamping: springDamping, springVelocity: springVelocity)
    }
    
    // MARK:- Custom Animation
    public func AnimateViewWithSpringDuration(_ name:UIView, animationDuration:TimeInterval, springDamping:CGFloat, springVelocity:CGFloat){
        provideAnimation(animationDuration: animationDuration, deleyTime: deleyTime, springDamping: springDamping, springVelocity: springVelocity)
    }
    
    // MARK:- Low Damping Custom Animation
    public func AnimateViewWithSpringDurationWithLowDamping(_ name:UIView, animationDuration:TimeInterval, springVelocity:CGFloat){
        provideAnimation(animationDuration: animationDuration, deleyTime: deleyTime, springDamping: lowSpringDamping, springVelocity: springVelocity)
    }
    
    private func provideAnimation(animationDuration:TimeInterval, deleyTime:TimeInterval, springDamping:CGFloat, springVelocity:CGFloat){
        self.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        UIView.animate(withDuration: animationDuration,
                       delay: deleyTime,
                       usingSpringWithDamping: springDamping,
                       initialSpringVelocity: springVelocity,
                       options: .allowUserInteraction,
                       animations: {
                        self.transform = CGAffineTransform.identity
        })
    }
}
