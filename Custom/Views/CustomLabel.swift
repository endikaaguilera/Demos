//
//  CustomLabel.swift
//  Demos
//
//  Created by ThisObey Studio on 1/11/18.
//  Copyright © 2018 ThisObey Studio. All rights reserved.
//

import UIKit

@IBDesignable open class CustomLabel: UILabel {
    
    private var pInitialText = "Loading"
    private var pSuccessText = "Success"
    private var pErrorText = "Error"
    
    @IBInspectable var adjustsFont: Bool {
        get {
            return self.adjustsFontSizeToFitWidth
        }
        set {
            self.adjustsFontSizeToFitWidth = newValue
        }
    }
    
    @IBInspectable var initialText: String {
        get {
            return self.pInitialText
        }
        set {
            self.pInitialText = newValue
            self.text = self.pInitialText
        }
    }
    
    @IBInspectable var successText: String {
        get {
            return self.pSuccessText
        }
        set {
            self.pSuccessText = newValue
        }
    }
    
    @IBInspectable var errorText: String {
        get {
            return self.pErrorText
        }
        set {
            self.pErrorText = newValue
        }
    }
}
