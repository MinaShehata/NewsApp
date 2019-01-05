//
//  LoginVC+LoginViewDelegate.swift
//  NewsApp
//
//  Created by Mina Shehata on 1/4/19.
//  Copyright © 2019 Mina Shehata. All rights reserved.
//

import UIKit

extension LoginVC: LoginView {
    func ShowSpinner() {
        StartLoading()
    }
    
    func HideSpinner() {
        StopLoading()
    }
    
    func LoginSuccess() {
        DispatchQueue.main.async {
            self.loginButton.isEnabled = false
            self.SuccessAlert (messaage: "Login Success", completion: {
                Router.restartApp(window: UIApplication.shared.keyWindow!)
            })
        }
    }
    
    func LoginError(error: String) {
        DispatchQueue.main.async {
            self.loginButton.isEnabled = true
            self.ErrorAlert(messaage: error, completion: nil)
        }
        // show alert error
    }
    
}
