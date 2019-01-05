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
    
    func addNewsSuccess(message: String, news: NewsDTO) {
        self.dismiss(animated: true) { [weak self] in
            guard let self = self else { return }
            self.SuccessAlert(messaage: message, completion: nil)
            self.delegate?.didAddNews(news: news)
        }
    }
    
    func errorAddNews(error: String) {
        self.dismiss(animated: true) { [weak self] in
            self?.ErrorAlert(messaage: error, completion: nil)
        }
    }
    
    func updateNewsSuccess(message: String, news: NewsDTO) {
        self.dismiss(animated: true) { [weak self] in
            guard let self = self else { return }
            self.SuccessAlert(messaage: message, completion: nil)
            let editedNews = news.copy() as? NewsDTO
            editedNews?.title = self.titleTextField.text!
            editedNews?.desc = self.descTextView.text
            self.delegate?.didUpdateNews(news: news, newNews: editedNews!)
        }
    }
    
    func errorUpdateNews(error: String) {
        self.dismiss(animated: true) { [weak self] in
            self?.ErrorAlert(messaage: error, completion: nil)
        }
    }
    
}
