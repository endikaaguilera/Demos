//
//  CustomImageView.swift
//  Demos
//
//  Created by ThisObey Studio on 1/11/18.
//  Copyright © 2018 ThisObey Studio. All rights reserved.
//

import UIKit

@IBDesignable open class CustomImageView: UIImageView {
    
//    private var pImageTintColor = UIColor.white

    @IBInspectable var tintableImage: UIImage {
        get {
            return self.image!
        }
        set {
            self.image = newValue
            self.setImageColor(color: self.tintColor)
        }
    }
    
//    @IBInspectable var color: UIColor {
//        get {
//            return self.tintColor
//        }
//        set {
//            self.tintColor = newValue
////            self.setImageColor(color: self.tintColor)
//        }
//    }
//    

    
}
