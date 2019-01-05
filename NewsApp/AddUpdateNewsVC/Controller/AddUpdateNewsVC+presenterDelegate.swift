//
//  AddUpdateNewsVC+presenterDelegate.swift
//  NewsApp
//
//  Created by Mina Shehata on 1/4/19.
//  Copyright © 2019 Mina Shehata. All rights reserved.
//

import Foundation

extension AddUpdateNewsVC: AddUpdateNewsView {
    
    func ShowSpinner() {
        StartLoading()
    }
    
    func HideSpinner() {
        StopLoading()
    }
    
    func addNewsSuccess(message: String) {
        self.dismiss(animated: true) { [weak self] in
            self?.SuccessAlert(messaage: message, completion: nil)
        }
    }
    
    func errorAddNews(error: String) {
        self.dismiss(animated: true) { [weak self] in
            self?.ErrorAlert(messaage: error, completion: nil)
        }
    }
    
    func updateNewsSuccess(message: String) {
        self.dismiss(animated: true) { [weak self] in
            self?.SuccessAlert(messaage: message, completion: nil)
        }
    }
    
    func errorUpdateNews(error: String) {
        self.dismiss(animated: true) { [weak self] in
            self?.ErrorAlert(messaage: error, completion: nil)
        }
    }
    
}
