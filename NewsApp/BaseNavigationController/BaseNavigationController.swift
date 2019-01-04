//
//  BaseNavigationController.swift
//  NewsApp
//
//  Created by Mina Shehata on 1/4/19.
//  Copyright © 2019 Mina Shehata. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
        
    }
    
    private func setupAppearance() {
        var font = UIFont.preferredFont(forTextStyle: .body).withSize(50)
        font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
        UINavigationBar.appearance().prefersLargeTitles = true
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        let attributes =  [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            .font : font
        ]
        UINavigationBar.appearance().titleTextAttributes = attributes
        UINavigationBar.appearance().largeTitleTextAttributes = attributes
        UINavigationBar.appearance().tintColor = .white
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
