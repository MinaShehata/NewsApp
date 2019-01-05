//
//  AddUpdateNewsViewDelegate.swift
//  NewsApp
//
//  Created by Mina Shehata on 1/5/19.
//  Copyright © 2019 Mina Shehata. All rights reserved.
//

import Foundation

protocol AddUpdateNewsViewDelegate: class {
    func didUpdateNews(news: NewsDTO, newNews: NewsDTO)
    func didAddNews(news: NewsDTO)
}

extension NewsVC: AddUpdateNewsViewDelegate {
    func didUpdateNews(news: NewsDTO, newNews: NewsDTO) {
        let index = presenter.updateNews(news: news, newNews: newNews)
        tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
    }
    
    func didAddNews(news: NewsDTO) {
        presenter.addNews(news: news)
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
    }
    
    
}
