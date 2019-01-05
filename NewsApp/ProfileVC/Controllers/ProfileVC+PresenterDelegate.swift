//
//  ProfileVC+PresenterDelegate.swift
//  NewsApp
//
//  Created by Mina Shehata on 1/5/19.
//  Copyright © 2019 Mina Shehata. All rights reserved.
//

import Foundation

extension ProfileVC: ProfileView {
    func ShowSpinner() {
        StartLoading()
    }
    
    func HideSpinner() {
        StopLoading()
    }
    func fetchUserSuccess(user: User) {
        userNameLabel.text = user.name
        emailLabel.text = user.email
    }
    
    func errorFetchUser(error: String) {
        presenter?.logout()

    }
    
    func logoutUser() {
        
    }
    
  
    
    
}
