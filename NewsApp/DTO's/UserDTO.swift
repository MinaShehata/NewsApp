//
//  UserDTO.swift
//  NewsApp
//
//  Created by Mina Shehata on 1/4/19.
//  Copyright © 2019 Mina Shehata. All rights reserved.
//

import SwiftyJSON

class User: NSObject {
    var id: Int?
    var name: String?
    var email: String?
    var password: String?
    
    init(json: JSON) {
        self.id = json["id"].int
        self.name = json["name"].string
        self.email = json["email"].string
    }
    
    init(name: String, email: String, password: String) {
        self.name = name
        self.email = email
        self.password = password
    }

    
}
