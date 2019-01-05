//
//  Router.swift
//  NewsApp
//
//  Created by Mina Shehata on 1/4/19.
//  Copyright © 2019 Mina Shehata. All rights reserved.
//

import UIKit

class Router {
    
    class func restartApp(window: UIWindow) {
//        guard let window = UIApplication.shared.keyWindow else { return }
        var vc: UIViewController?
        
        if let _ = UserInteractor.getToken() {
            vc = UIStoryboard.storyboard(with: "NewsStoryboard").instantiateInitialViewController()
        } else {
            vc = BaseNavigationController(rootViewController: LoginVC())
        }
        
        window.rootViewController = vc
        UIView.transition(with: window, duration: 0.5, options: [.transitionCrossDissolve], animations: {

        }) { (success) in

        }
        
    }
    
}
