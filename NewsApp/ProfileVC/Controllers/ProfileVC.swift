//
//  ProfileVC.swift
//  NewsApp
//
//  Created by Mina Shehata on 1/5/19.
//  Copyright © 2019 Mina Shehata. All rights reserved.
//

import UIKit

class ProfileVC: BaseViewController {

    @IBOutlet weak var profileImageView: UIButtonX!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!

    var presenter: ProfilePresenter?
    
    override func setup() {
        super.setup()
        presenter = ProfilePresenter(view: self)
        customNavigationController()
        presenter?.viewDidLoad()
        
        addRightBarButton(image: #imageLiteral(resourceName: "dismiss"), with: #selector(dismissView))
    }
    
    @objc private func dismissView() {
        presentingViewController?.dismiss(animated: true)
    }
    private func customNavigationController() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    @IBAction func logoutButton(_ sender: UIButtonX) {
        presenter?.logout()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}


