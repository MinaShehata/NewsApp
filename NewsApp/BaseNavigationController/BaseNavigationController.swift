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
        navigationBar.shadowImage = UIImage()
        navigationBar.tintColor = .white
        var font = UIFont.preferredFont(forTextStyle: .body).withSize(50)
        font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
        navigationBar.barTintColor = .blueColor
        navigationBar.prefersLargeTitles = true
        navigationBar.isTranslucent = false
        let largeAttributes =  [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            .font : font
        ]
        let smallAttributes =  [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            .font : UIFont.systemFont(ofSize: 25)
        ]
        navigationBar.largeTitleTextAttributes = largeAttributes
        navigationBar.titleTextAttributes = smallAttributes
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

class ProfileNavigationController: UINavigationController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}

extension UIViewController {
    func addRightBarButton(image: UIImage, with selector: Selector) {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: selector)
    }
    
    func addRightBarButton(title: String, selector: Selector) {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: self, action: selector)
    }
    
    func addLeftBarButton(title: String, selector: Selector) {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: self, action: selector)
    }
    func addLeftBarButton(image: UIImage, selector: Selector) {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: selector)
    }
    
    @objc func handleCancel() {
        dismiss(animated: true)
    }
    
    func addLeftBarButtons(titles: [String], selector: [Selector]) {
        var barButtons = [UIBarButtonItem]()
        for (index, title) in titles.enumerated() {
            barButtons.append(UIBarButtonItem(title: title, style: .plain, target: self, action: selector[index]))
        }
        navigationItem.leftBarButtonItems = barButtons
    }
}
