//
//  UserInteractor.swift
//  NewsApp
//
//  Created by Mina Shehata on 1/4/19.
//  Copyright © 2019 Mina Shehata. All rights reserved.
//

import Foundation

typealias userCompletion = (_ user: UserDTO?, _ error: String?) -> ()

final class UserInteractor {
    
    func login(user: UserDTO, completion: @escaping userCompletion) {
        NetworkLoader.shared.request(url: URLs.login, parameters: ["email": user.email, "password": user.password], method: .post) { [weak self] (error, json) in
            guard let self = self else { return }
            if let error = error {
                completion(nil, error.localizedDescription)
                return
            }
            
            if let json = json, let token = json["result"]["token"].string {
                // save to user deaulr token
                self.save(token: token)
                completion(user, nil)
            }
        }
    }
    
    
    func register(user: UserDTO, completion: @escaping userCompletion) {
        NetworkLoader.shared.request(url: URLs.login, parameters: ["name" : user.name, "email": user.email, "password": user.password], method: .post) { [weak self] (error, json) in
            guard let self = self else { return }
            if let error = error {
                completion(nil, error.localizedDescription)
                return
            }
            
            if let json = json, let token = json["result"]["token"].string {
                // save to user deaulr token
                self.save(token: token)
            }
            
        }
    }
    
    @discardableResult
    func save(token: String) -> Bool {
        let userDef = UserDefaults.standard
        userDef.set(token, forKey: "Bearer")
        userDef.synchronize()
        return true
    }
    
    func getToken() -> String {
        let userDef = UserDefaults.standard
        let Bearer = userDef.value(forKey: "Bearer") as! String
        userDef.synchronize()
        return Bearer
    }
}



