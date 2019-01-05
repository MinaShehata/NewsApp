//
//  LoginPresenter.swift
//  NewsApp
//
//  Created by Mina Shehata on 1/4/19.
//  Copyright © 2019 Mina Shehata. All rights reserved.
//

import Foundation


protocol LoginView: class, SpinnerView {
    func LoginSuccess()
    func LoginError(error: String)
}

class LoginPresenter {
    
    private weak var view: LoginView?
    private let userInteractor = UserInteractor()

    init(view: LoginView) {
        self.view = view
    }
    
    func validateLogin(email: String, password: String, completion: (_ success: Bool, _ error: String?) -> ()) {
        let validation = Validation()
        guard !email.isEmpty else {
            completion(false, "Enter Email Address")
            return
        }
        validation.email = email
        guard validation.isValidEmailAddress(emailAddressString: email) else {
            completion(false, "Enter a valid email address")
            return
        }
        
        guard !password.isEmpty else {
            completion(false, "Enter password")
            return
        }
        validation.password = password
        guard validation.isValidPassword(passwordString: password) else {
            completion(false, "Enter a valid password")
            return
        }
        completion(true, nil)
    }
    
    func login(user: User) {
        view?.ShowSpinner()
        userInteractor.login(user: user) { [weak self] (user, error) in
            guard let self = self else { return }
            self.view?.HideSpinner()
            if let error = error {
                self.view?.LoginError(error: error)
                return
            }
            if let _ = user {
                self.view?.LoginSuccess()
            }
        }
        
    }
    
}
