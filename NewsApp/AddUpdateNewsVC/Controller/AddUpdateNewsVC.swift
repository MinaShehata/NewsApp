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
    @IBOutlet weak var descTextView: IQTextView! {
        didSet {
            descTextView.layer.cornerRadius = 10
            descTextView.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var addUpdateButton: UIButtonX!
    @IBOutlet weak var blurView: UIVisualEffectView!
    
    var news: NewsDTO?
    var presenter: AddUpdateViewPresenter?
    weak var delegate: AddUpdateNewsViewDelegate?
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
        presenter?.validateInputs(title: titleTextField.text!, desc: descTextView.text, completion: { [weak self](success, error) in
            guard let self = self else { return }
            if let error = error {
                self.ErrorAlert(messaage: error)
            }
            if success {
                if let news = self.news {
                    self.presenter?.updateNews(news: news)
                } else {
                    self.presenter?.addNews(news: NewsDTO(id: 0, title: self.titleTextField.text!, desc: self.descTextView.text))
                }
            }
        })
    }
    @IBAction func cancelButtonPressed(_ sender: UIButtonX) {
        view.endEditing(true)
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
