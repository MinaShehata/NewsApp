//
//  AddUpdateNewsPresenter.swift
//  
//
//  Created by Mina Shehata on 1/4/19.
//

import Foundation

protocol AddUpdateNewsView: class, SpinnerView {
    
    func addNewsSuccess(message: String, news: NewsDTO)
    func errorAddNews(error: String)
    
    func updateNewsSuccess(message: String, news: NewsDTO)
    func errorUpdateNews(error: String)
    
}

class AddUpdateViewPresenter {
    
    private weak var view: AddUpdateNewsView?
    private var newsInteractor = NewsInteractor()
    
    init(view: AddUpdateNewsView) {
        self.view = view
    }
    
    func validateInputs(title: String, desc: String, completion: @escaping (_ success: Bool, _ error: String?) -> ()) {
        guard !title.isEmpty else {
            completion(false, "Enter news title")
            return
        }
        
        guard !desc.isEmpty else {
            completion(false, "Enter news desc")
            return
        }
        
        completion(true, nil)
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
                self.view?.addNewsSuccess(message: message, news: news)
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
                self.view?.updateNewsSuccess(message: message, news: news)
            }
        }
    }
}
