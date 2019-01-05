//
//  RegisterPresenter.swift
//  NewsApp
//
//  Created by Mina Shehata on 1/4/19.
//  Copyright © 2019 Mina Shehata. All rights reserved.
//

import Foundation

protocol RegisterView: class, SpinnerView {
    func registerSuccess()
    func registerError(error: String)
}

class RegisterPresenter {
    
    private weak var view: RegisterView?
    private let userInteractor = UserInteractor()
    
    init(view: RegisterView) {
        self.view = view
    }
    
    
    func validateRegister(username: String, email: String, password: String, completion: (_ success: Bool, _ error: String?) -> ()) {
        let validation = Validation()
        
        guard !username.isEmpty else {
            completion(false, "Enter user name")
            return
        }
        validation.email = email
        guard validation.isValidUserName(userNameString: username) else {
            completion(false, "Enter a valid user name")
            return
        }
        
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
    
    func register(user: User) {
        view?.ShowSpinner()
        userInteractor.register(user: user) { [weak self](user, error) in
            guard let self = self else { return }
            self.view?.HideSpinner()
            if let error = error {
                self.view?.registerError(error: error)
                return
            }
            if let _ = user {
                self.view?.registerSuccess()
            }
        }
    }
    
}
