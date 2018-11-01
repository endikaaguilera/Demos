//
//  CustomLoadingIndicator.swift
//  Demos
//
//  Created by ThisObey Studio on 1/11/18.
//  Copyright © 2018 ThisObey Studio. All rights reserved.
//

import UIKit

class CustomLoadingIndicator: UIView {
    
    // MARK: - Public API
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var indicatorContentView: CustomView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var image: CustomImageView!
    @IBOutlet weak var label: CustomLabel!
    
    public func show(parentView: UIView) {
        
        DispatchQueue.main.async {
            
            // TODO - Test this on a device with notch (try to dismiss the app)
            UIApplication.shared.beginIgnoringInteractionEvents()
            
            parentView.addSubview(self)
            
            self.label!.text = self.label.initialText
            
            self.setContentAlpha(alpha: 1)
            self.setIndicatorAlpha(alpha: 0)
            self.setSuccessAlpha(alpha: 0)
            
            UIView.animate(withDuration: 0.25, animations: {
                
                self.setIndicatorAlpha(alpha: 1)
                
            })
        }
    }
    
    public func hide() {
        
        DispatchQueue.main.async {
            
            UIApplication.shared.endIgnoringInteractionEvents()
            self.removeFromSuperview()
            
        }
        
    }
    
    public func hide(success: Bool) {
        
        if success {
            
            self.update(imageName: "Success", labelText: self.label.successText)
            
        } else {
            
            self.update(imageName: "Error", labelText: self.label.errorText)
            
        }
        
    }
    
    // MARK: - Private API
    
    private func setContentAlpha(alpha: CGFloat) {
        
        self.contentView.alpha = alpha
        self.indicatorContentView.alpha = alpha
        
    }
    
    private func setIndicatorAlpha(alpha: CGFloat) {
        
        self.indicator.alpha = alpha
        self.label.alpha = alpha
        
    }
    
    private func setSuccessAlpha(alpha: CGFloat) {
        
        self.image.alpha = alpha
        self.label.alpha = alpha
        
    }
    
    private func update(imageName: String, labelText: String, animate: Bool = true) {
        
        UIView.animate(withDuration: 0.25, animations: {
            
            self.setIndicatorAlpha(alpha: 0)
            
        }) { completion in
            
            self.image!.image = UIImage(named: imageName)
            self.image!.setImageColor(color: self.image!.tintColor)
            self.label!.text = labelText
            
            if animate {
                self.indicatorContentView.AnimateView()
            }
            
            UIView.animate(withDuration: 0.5, animations: {
                
                self.setSuccessAlpha(alpha: 1)
                
            }) { completion in
                
                UIView.animate(withDuration: 1, animations: {
                    
                    self.setContentAlpha(alpha: 0)
                    
                }) { completion in
                    
                    self.hide()
                    
                }
            }
        }
    }
    
    // MARK: - Setup
    
    private func setupNib() {
        
        Bundle.main.loadNibNamed("LoadingIndicator", owner: self, options: nil)
        
    }
    
    private func setupContentView() {
        
        self.addSubview(contentView!)
        self.contentView!.frame =
            UIApplication.shared.keyWindow?.frame ?? UIScreen.main.bounds
        
    }
    
    private func setupIndicator() {
        
        self.indicator!.startAnimating()
        
    }
    
    private func setupLabel() {
        
        self.label!.text = self.label.initialText
        
    }
    
    private func setup() {
        
        DispatchQueue.main.async {
            
            self.setupNib()
            self.setupContentView()
            self.setupIndicator()
            self.setupLabel()
            
        }
        
    }
    
    // MARK: - Init
    
    override public init(frame: CGRect) {
        
        super.init(frame: frame)
        self.setup()
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        self.setup()
        
    }
    
}
