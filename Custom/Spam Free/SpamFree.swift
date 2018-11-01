//
//  SpamFree.swift
//  Demos
//
//  Created by ThisObey Studio on 1/11/18.
//  Copyright © 2018 ThisObey Studio. All rights reserved.
//

import UIKit

class SpamFree: UIView {

    // MARK: - Public API

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var okBtn: UIButton!
    
    public func show(parentView: UIView) {
        
        print("show")

        DispatchQueue.main.async {
            
//            UIApplication.shared.beginIgnoringInteractionEvents()
            
            parentView.addSubview(self)

        }
    }
    
    public func hide() {
        
        DispatchQueue.main.async {
            
//            UIApplication.shared.endIgnoringInteractionEvents()
            
            self.removeFromSuperview()
            
        }
        
    }
    
    @IBAction func cancelBtnAction(_ sender: Any) {
        
        print("cancelBtnAction")
        self.hide()
        
    }
    
    @IBAction func okBtnAction(_ sender: Any) {
        
        print("okBtnAction")
        self.hide()

    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let hitView = super.hitTest(point, with: event)
        if hitView != nil {
            superview?.bringSubviewToFront(self)
        }
        return hitView
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let rect = self.bounds
        var isInside = rect.contains(point)
        if !isInside {
            for view in subviews {
                isInside = view.frame.contains(point)
                if isInside {
                    break
                }
            }
        }
        return isInside
    }
    
    // MARK: - Setup
    
    private func setupNib() {
        
        Bundle.main.loadNibNamed("SpamFree", owner: self, options: nil)
        
    }
    
    private func setupContentView() {
        
        self.addSubview(contentView!)
        self.contentView!.frame =
            UIApplication.shared.keyWindow?.frame ?? UIScreen.main.bounds
    }
    
    private func setup() {
        
        DispatchQueue.main.async {
            
            self.setupNib()
            self.setupContentView()
            
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
