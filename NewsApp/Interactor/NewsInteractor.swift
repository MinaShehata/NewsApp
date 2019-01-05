//
//  NewsInteractor.swift
//  NewsApp
//
//  Created by Mina Shehata on 1/4/19.
//  Copyright © 2019 Mina Shehata. All rights reserved.
//

import Foundation

typealias fetchCompletion = (_ data: [NewsDTO]?, _ error: String?) -> ()
typealias crudCompletion = (_ message: String?, _ error: String?) -> ()

class NewsInteractor {
    
    func fetchNews(completion: @escaping fetchCompletion) {
        NetworkLoader.shared.request(url: URLs.news, method: .get) { (error, json) in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil, error.localizedDescription)
                return
            }
            if let json = json, let data = json["data"].array {
                let news: [NewsDTO] = data.map { let newsObject = NewsDTO(with: $0); return newsObject }
                completion(news, nil)
            }
        }
    }
    
    func addNews(news: NewsDTO, completion: @escaping crudCompletion) {
        NetworkLoader.shared.request(url: URLs.add, parameters: ["title": news.title ?? "", "description": news.desc ?? ""], method: .post) { (error, json) in
            if let error = error {
                completion(nil, error.localizedDescription)
                return
            }
            if let message = json?["message"].string {
                print(message)
                completion(message, nil)
            }
        }
    }
    
    
    func updateNews(news: NewsDTO, completion: @escaping crudCompletion) {
        NetworkLoader.shared.request(url: URLs.update + "\(news.id!)/update", parameters: ["title": news.title ?? "", "description": news.desc ?? ""], method: .post) { (error, json) in
            if let error = error {
                completion(nil, error.localizedDescription)
                return
            }
            if let message = json?["message"].string {
                print(message)
                completion(message, nil)
            }
        }
    }
    
    
    func deleteNews(id: Int, completion: @escaping crudCompletion) {
        NetworkLoader.shared.request(url: URLs.delete + "\(id)/delete", method: .post) { (error, json) in
            if let error = error {
                completion(nil, error.localizedDescription)
                return
            }
            if let message = json?["message"].string  {
                completion(message, nil)
            }
        }
    }
   
    
}
