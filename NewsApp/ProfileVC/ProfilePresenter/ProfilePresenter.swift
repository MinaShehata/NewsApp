//
//  ProfilePresenter.swift
//  NewsApp
//
//  Created by Mina Shehata on 1/5/19.
//  Copyright © 2019 Mina Shehata. All rights reserved.
//

import Foundation

protocol ProfileView: class, SpinnerView {
    
    func fetchUserSuccess(user: User)
    func errorFetchUser(error: String)
    
    func logoutUser()
    
}

class ProfilePresenter {
    
    private weak var view: ProfileView?
    private let userInteractor = UserInteractor()
    
    init(view: ProfileView) {
        self.view = view
    }
    
    func viewDidLoad() {
        view?.ShowSpinner()
        userInteractor.fetchUserData { [weak self] (user, error) in
            guard let self = self else { return }
            self.view?.HideSpinner()
            
            if let error = error {
                self.view?.errorFetchUser(error: error)
            }
            if let user = user {
                self.view?.fetchUserSuccess(user: user)
            }
            
        }
        
    }
    
    func logout() {
        UserInteractor.removeCredential()
    }
    
}
