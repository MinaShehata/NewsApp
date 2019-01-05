//
//  AddNewsVC.swift
//  NewsApp
//
//  Created by Mina Shehata on 1/4/19.
//  Copyright © 2019 Mina Shehata. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

class AddUpdateNewsVC: BaseViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descTextView: IQTextView!
    @IBOutlet weak var addUpdateButton: UIButtonX!
    @IBOutlet weak var blurView: UIVisualEffectView!
    
    var news: NewsDTO?
    var presenter: AddUpdateViewPresenter?
    
    override func setup() {
        super.setup()
        presenter = AddUpdateViewPresenter(view: self)
        setupUI()
        
    }
    
    private func setupUI() {
        if let news = news  {
            titleTextField.text = news.title ?? ""
            descTextView.text = news.desc ?? ""
            addUpdateButton.setTitle("Update", for: .normal)
        }
        
        
        
    }
    
    @IBAction func dismissVisualBlurView(_ sender: UITapGestureRecognizer) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func addButtonPressed(_ sender: UIButtonX) {
        view.endEditing(true)
        if let news = news {
            presenter?.updateNews(news: news)
        } else {
            presenter?.addNews(news: NewsDTO(id: 0, title: titleTextField.text!, desc: descTextView.text))
        }
    }
    @IBAction func cancelButtonPressed(_ sender: UIButtonX) {
        view.endEditing(true)
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
