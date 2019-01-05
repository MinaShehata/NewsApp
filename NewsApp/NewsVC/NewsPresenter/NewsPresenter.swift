//
//  NewsPresenter.swift
//  NewsApp
//
//  Created by Mina Shehata on 1/4/19.
//  Copyright © 2019 Mina Shehata. All rights reserved.
//

import Foundation

protocol NewsView: class, SpinnerView {
    func fetchDataSuccess()
    func fetchDataError(error: String)
    
    func deleteError(error: String)
    func deleteSuccess(message: String)
}

class NewsPresenter {
    
    private weak var view: NewsView?
    private let newsInteractor = NewsInteractor()
    private var data: [NewsDTO] = []
    // Dependancy Injection......
    init(view: NewsView) {
        self.view = view
    }
    
    
    func viewDidLoad() {
        view?.ShowSpinner()
        newsInteractor.fetchNews { [weak self] (data, error) in
            guard let self = self else { return }
            self.view?.HideSpinner()
            if let error = error {
                self.view?.fetchDataError(error: error)
                return
            }
            if let data = data {
                self.data = data
                self.view?.fetchDataSuccess()
            }
        }
    }
    
    func getNewsCount() -> Int {
        return data.count
    }
    func configure(cell: NewsCellView, at index: Int) {
        let news = data[index]
        cell.displayTitle(title: news.title ?? "")
        cell.displayDesc(description: news.desc ?? "")
    }
    
    
    func deleteNews(at index: Int) {
        let news = data[index]
        view?.ShowSpinner()
        newsInteractor.deleteNews(id: news.id!) { [weak self](message, error) in
            guard let self = self else { return }
            self.view?.HideSpinner()
            if let error = error {
                self.view?.deleteError(error: error)
            }
            if let message = message {
                self.view?.deleteSuccess(message: message)
            }
        }
    }
    
    func getEditedNews(at index: Int) -> NewsDTO {
        return data[index]
    }
    
    
    func addNews(news: NewsDTO) {
        data.insert(news, at: 0)
    }
    
    func updateNews(news: NewsDTO, newNews: NewsDTO) -> Int {
        let index = data.index(of: news)
        data.remove(at: index!)
        data.insert(newNews, at: index!)
        return index!
    }
}

