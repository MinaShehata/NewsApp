//
//  LoginVC+LoginViewDelegate.swift
//  NewsApp
//
//  Created by Mina Shehata on 1/4/19.
//  Copyright © 2019 Mina Shehata. All rights reserved.
//

import Foundation

extension LoginVC: LoginView {
    func ShowSpinner() {
        StartLoading()
    }
    
    func HideSpinner() {
        StopLoading()
    }
    
    func LoginSuccess() {
        print("User login successfully with token")
    }
    
    func LoginError(error: String) {
        // show alert error
    }
    
}
