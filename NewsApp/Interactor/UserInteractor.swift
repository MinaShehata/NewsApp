//
//  UserInteractor.swift
//  NewsApp
//
//  Created by Mina Shehata on 1/4/19.
//  Copyright © 2019 Mina Shehata. All rights reserved.
//

import UIKit

typealias userCompletion = (_ user: User?, _ error: String?) -> ()

final class UserInteractor {
    
    func login(user: User, completion: @escaping userCompletion) {
        NetworkLoader.shared.request(url: URLs.login, parameters: ["email": user.email!, "password": user.password!], method: .post) { [weak self] (error, json) in
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
    
    
    func register(user: User, completion: @escaping userCompletion) {
        NetworkLoader.shared.request(url: URLs.register, parameters: ["name" : user.name!, "email": user.email!, "password": user.password!], method: .post) { [weak self] (error, json) in
            guard let self = self else { return }
            if let error = error {
                completion(nil, error.localizedDescription)
                return
            }
            
            if let json = json, let token = json["token"].string {
                self.save(token: token)
                completion(user, nil)
            }
        }
    }
    
    
    func fetchUserData(completion: @escaping userCompletion) {
        NetworkLoader.shared.request(url: URLs.profile, method: .get) { (error, json) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil, error.localizedDescription)
                return
            }
            if let json = json?["user"] {
                let user = User(json: json)
                completion(user, nil)
            }
        }
    }
    
    
    
    @discardableResult
    func save(token: String) -> Bool {
        let userDef = UserDefaults.standard
        userDef.set(token, forKey: "Bearer")
        return userDef.synchronize()
    }
    
    class func getToken() -> String? {
        let userDef = UserDefaults.standard
        if let Bearer = userDef.value(forKey: "Bearer") as? String {
            return Bearer
        }
        return nil
    }
    
    class func removeCredential() {
        let userDef = UserDefaults.standard
        userDef.removeObject(forKey: "Bearer")
        userDef.synchronize()
        Router.restartApp(window: UIApplication.shared.keyWindow!)
    }
}



