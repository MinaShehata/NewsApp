//
//  NewsVC+NewsPresenterDelegate.swift
//  NewsApp
//
//  Created by Mina Shehata on 1/4/19.
//  Copyright © 2019 Mina Shehata. All rights reserved.
//

import Foundation

extension NewsVC: NewsView {
    
    func ShowSpinner() {
        StartLoading()
    }
    
    func HideSpinner() {
        StopLoading()
    }
    
    func fetchDataSuccess() {
        tableView.reloadData()
    }
    
    func fetchDataError(error: String) {
        ErrorAlert(messaage: error, completion: nil)
    }
    
    func deleteError(error: String) {
        ErrorAlert(messaage: error, completion: nil)
    }
    
    func deleteSuccess(message: String) {
        SuccessAlert(messaage: message, completion: nil)
    }
    
}
