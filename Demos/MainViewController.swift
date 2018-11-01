//
//  ViewController.swift
//  Demos
//
//  Created by ThisObey Studio on 1/11/18.
//  Copyright © 2018 ThisObey Studio. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    //    let cli = CustomLoadingIndicator()
    let spamFree = SpamFree()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.spamFree.show(parentView: self.view)
    }
    
    var visible = false
    
    func simulateTask() {
        // wait 5 seconds to simulate some work happening
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.showSimpleLoadingIndicator(self)
        }
    }
    
    func simulateTask(success: Bool) {
        // wait 5 seconds to simulate some work happening
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            if success {
                self.showSuccessLoadingIndicator(self)
            } else {
                self.showErrorLoadingIndicator(self)
            }
        }
    }
    
    @IBAction func showSimpleLoadingIndicator(_ sender: Any) {
        if visible {
            self.view.hideLoadingIndicator()
        } else {
            self.view.showLoadingIndicator()
            simulateTask()
        }
        self.visible = !visible
    }
    
    @IBAction func showSuccessLoadingIndicator(_ sender: Any) {
        if visible {
            self.view.hideLoadingIndicator(success: true)
        } else {
            self.view.showLoadingIndicator()
            simulateTask(success: true)
        }
        self.visible = !visible
    }
    
    @IBAction func showErrorLoadingIndicator(_ sender: Any) {
        if visible {
            self.view.hideLoadingIndicator(success: false)
        } else {
            self.view.showLoadingIndicator()
            simulateTask(success: false)
        }
        self.visible = !visible
    }
    
}

