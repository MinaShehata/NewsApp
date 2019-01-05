//
//  NewsDTO.swift
//  NewsApp
//
//  Created by Mina Shehata on 1/4/19.
//  Copyright © 2019 Mina Shehata. All rights reserved.
//

import SwiftyJSON

class NewsDTO: NSObject, NSCopying {
    
    var id: Int?
    var title: String?
    var desc: String?
    
    init(with json: JSON) {
        self.id = json["id"].int
        self.title = json["title"].string
        self.desc = json["description"].string
    }
    
    init(id: Int, title: String?, desc: String?) {
        self.id = id
        self.title = title
        self.desc = desc
    }
    
    
    func copy(with zone: NSZone? = nil) -> Any {
        let editedNews = NewsDTO(id: self.id!, title: self.title!, desc: self.desc!)
        editedNews.id = self.id
        editedNews.title = self.title
        editedNews.desc = self.desc
        return editedNews
    }
    
}

