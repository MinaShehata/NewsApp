//
//  AddUpdateNewsPresenter.swift
//  
//
//  Created by Mina Shehata on 1/4/19.
//

import Foundation

protocol AddUpdateNewsView: class, SpinnerView {
    
    func addNewsSuccess(message: String)
    func errorAddNews(error: String)
    
    func updateNewsSuccess(message: String)
    func errorUpdateNews(error: String)
    
}

class AddUpdateViewPresenter {
    
    private weak var view: AddUpdateNewsView?
    private var newsInteractor = NewsInteractor()
    
    init(view: AddUpdateNewsView) {
        self.view = view
    }
    
    func addNews(news: NewsDTO) {
        view?.ShowSpinner()
        newsInteractor.addNews(news: news) { [weak self] (message, error) in
            guard let self = self else { return }
            self.view?.HideSpinner()
            if let error = error {
                self.view?.errorAddNews(error: error)
            }
            if let message = message {
                self.view?.addNewsSuccess(message: message)
            }
        }
    }
    
    func updateNews(news: NewsDTO) {
        view?.ShowSpinner()
        newsInteractor.updateNews(news: news) {  [weak self] (message, error) in
            guard let self = self else { return }
            self.view?.HideSpinner()
            if let error = error {
                self.view?.errorUpdateNews(error: error)
            }
            if let message = message {
                self.view?.updateNewsSuccess(message: message)
            }
        }
    }
}
