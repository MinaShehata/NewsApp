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
    
    
    func login(user: UserDTO) {
        view?.ShowSpinner()
        userInteractor.login(user: user) { [weak self] (user, error) in
            guard let self = self else { return }
            self.view?.HideSpinner()
            if let error = error {
                self.view?.LoginError(error: error)
            }
            if let _ = user {
                self.view?.LoginSuccess()
            }
            
        }
        
    }
    
}
