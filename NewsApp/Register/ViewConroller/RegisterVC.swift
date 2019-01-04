//
//  RegisterV.swift
//  NewsApp
//
//  Created by Mina Shehata on 1/4/19.
//  Copyright © 2019 Mina Shehata. All rights reserved.
//

import UIKit

class RegisterVC: BaseViewController {
    
    // MARK:- properities......
    let backgroundImageView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "Background"))
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let containerView: UIViewX = {
        let cv = UIViewX()
        cv.cornerRadius = 15
        cv.backgroundColor = #colorLiteral(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        cv.shadowColor = .black
        cv.shadowOffset = CGSize(width: 0.5, height: 0.5)
        cv.shadowRadius = 5
        cv.shadowOpacity = 0.5
        return cv
    }()
    
    // MARK:- text fields
    let userNameTextField: UITextFieldX = {
        let tf = UITextFieldX()
        tf.borderStyle = .none
        tf.keyboardType = .default
        tf.tintColor = #colorLiteral(red: 0.9089863579, green: 0.9089863579, blue: 0.9089863579, alpha: 0.494140625)
        tf.textColor = .white
        tf.placeholder = "User Name"
        tf.leftImage = #imageLiteral(resourceName: "UserImage")
        tf.leftPadding = 5
        tf.cornerRadius = 15
        tf.clipsToBounds = true
        tf.backgroundColor = .clear
        return tf
    }()
    
    let emailTextField: UITextFieldX = {
        let tf = UITextFieldX()
        tf.borderStyle = .none
        tf.keyboardType = .emailAddress
        tf.tintColor = #colorLiteral(red: 0.9089863579, green: 0.9089863579, blue: 0.9089863579, alpha: 0.494140625)
        tf.textColor = .white
        tf.placeholder = "Email"
        tf.leftImage = #imageLiteral(resourceName: "emailImage")
        tf.leftPadding = 5
        tf.cornerRadius = 15
        tf.clipsToBounds = true
        tf.backgroundColor = .clear
        return tf
    }()
    
    let passwordTextField: UITextFieldX = {
        let tf = UITextFieldX()
        tf.borderStyle = .none
        tf.keyboardType = .default
        tf.tintColor = #colorLiteral(red: 0.9089863579, green: 0.9089863579, blue: 0.9089863579, alpha: 0.494140625)
        tf.placeholder = "Password"
        tf.isSecureTextEntry = true
        tf.textColor = .white
        tf.leftImage = #imageLiteral(resourceName: "Password")
        tf.leftPadding = 5
        tf.cornerRadius = 15
        tf.clipsToBounds = true
        tf.backgroundColor = .clear
        return tf
    }()
    
    
    let unSsepratorLine: UIViewX = {
        let sp = UIViewX()
        sp.cornerRadius = 5
        sp.backgroundColor = .white
        return sp
    }()
    
    let emSsepratorLine: UIViewX = {
        let sp = UIViewX()
        sp.cornerRadius = 5
        sp.backgroundColor = .white
        return sp
    }()
    
    let passSsepratorLine: UIViewX = {
        let sp = UIViewX()
        sp.cornerRadius = 5
        sp.backgroundColor = .white
        return sp
    }()
    
    lazy var registerButton: UIButtonX = {
        let button = UIButtonX(type: .system)
        button.backgroundColor = .orangeColor
        button.cornerRadius = 22
        button.shadowColor = .black
        button.shadowOpacity = 0.7
        button.shadowRadius = 4
        button.setTitle("Register", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.shadowOffset = CGSize(width: 0.5, height: 0.5)
        button.addTarget(self, action: #selector(registerButtonPressed), for: .touchUpInside)
        return button
    }()
    
    //private var presenter: LoginPresenter!
    
    override func setup() {
        super.setup()
        //presenter = LoginPresenter(view: self)
        setupUI()
        
    }
    
    private func setupUI() {
        navigationItem.title = "Register"
        
        // add backgroundImage View......
        view.addSubview(backgroundImageView)
        backgroundImageView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        
        view.addSubview(containerView)
        containerView.anchorSize(to: view, size: CGSize(width: view.frame.width - 32, height: 172), center: true)
        
        containerView.addSubview(userNameTextField)
        userNameTextField.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 8, left: 8, bottom: 0, right: 8), size: CGSize(width: 0, height: 44))
        
        containerView.addSubview(unSsepratorLine)
        unSsepratorLine.anchor(top: userNameTextField.bottomAnchor, leading: userNameTextField.leadingAnchor, bottom: nil, trailing: userNameTextField.trailingAnchor, padding: .init(top: 2, left: 0, bottom: 0, right: 0), size: CGSize(width: 0, height: 1))
        
        
        containerView.addSubview(emailTextField)
        emailTextField.anchor(top: userNameTextField.bottomAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 4, left: 8, bottom: 0, right: 8), size: CGSize(width: 0, height: 44))
        
        containerView.addSubview(emSsepratorLine)
        emSsepratorLine.anchor(top: emailTextField.bottomAnchor, leading: emailTextField.leadingAnchor, bottom: nil, trailing: emailTextField.trailingAnchor, padding: .init(top: 2, left: 0, bottom: 0, right: 0), size: CGSize(width: 0, height: 1))
        
        containerView.addSubview(passwordTextField)
        passwordTextField.anchor(top: emailTextField.bottomAnchor, leading: containerView.leadingAnchor, bottom: containerView.bottomAnchor, trailing: containerView.trailingAnchor, padding: .init(top: 4, left: 8, bottom: 16, right: 8), size: CGSize(width: 0, height: 44))
        
        containerView.addSubview(passSsepratorLine)
        passSsepratorLine.anchor(top: passwordTextField.bottomAnchor, leading: passwordTextField.leadingAnchor, bottom: nil, trailing: passwordTextField.trailingAnchor, padding: .init(top: 2, left: 0, bottom: 8, right: 0), size: CGSize(width: 0, height: 1))
        
        
        view.addSubview(registerButton)
        registerButton.anchor(top: containerView.bottomAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 16, left: 0, bottom: 0, right: 0), size: CGSize(width: 0, height: 44))
        
    }
    
    @objc func registerButtonPressed(_ sender: UIButton) {
        //let user = UserDTO(name: "", email: emailTextField.text!, password: passwordTextField.text!)
    }
    

}
