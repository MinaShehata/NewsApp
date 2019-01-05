//
//  URLs.swift
//  NewsApp
//
//  Created by Mina Shehata on 1/4/19.
//  Copyright © 2019 Mina Shehata. All rights reserved.
//

import Foundation

struct URLs {
    static let baseURL = "http://192.232.198.55/~khaled/api/"
    
    static let login = baseURL + "login"
    static let register = baseURL + "registration"
    static let news = baseURL + "news"
    static let add = baseURL + "news/add"
    static let update = baseURL + "news/"
    static let delete = baseURL + "news/"
    static let profile = baseURL + "user"
    
}
