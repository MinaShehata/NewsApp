//
//  RegisterVC+RegisterViewDelegate.swift
//  NewsApp
//
//  Created by Mina Shehata on 1/4/19.
//  Copyright © 2019 Mina Shehata. All rights reserved.
//

import UIKit

extension RegisterVC: RegisterView {
    func registerSuccess() {
        DispatchQueue.main.async {
            self.registerButton.isEnabled = false
            self.SuccessAlert (messaage: "Register Success", completion: {
                Router.restartApp(window: UIApplication.shared.keyWindow!)
            })
        }
    }
    
    func registerError(error: String) {
        DispatchQueue.main.async {
            self.registerButton.isEnabled = true
            self.ErrorAlert(messaage: error, completion: nil)
        }
        
        // show alert error
    }
    
    func ShowSpinner() {
        StartLoading()
    }
    
    func HideSpinner() {
        StopLoading()
    }
    
    
}
