//
//  NewsVC.swift
//  NewsApp
//
//  Created by Mina Shehata on 1/4/19.
//  Copyright © 2019 Mina Shehata. All rights reserved.
//

import UIKit
import CoreData

struct NewsVCConstants {
    static let ProfileVCSegue = "ProfileVCSegue"
    static let NewsCell = "NewsCell"
    static let AddNewsVCSegue = "AddNewsVCSegue"
}

class NewsVC: BaseViewController {

    lazy var refresher: UIRefreshControl = {
        let refControl = UIRefreshControl()
        refControl.tintColor = .white
        refControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        return refControl
    }()
    
    @IBOutlet var tableView: UITableView!
    
    var presenter: NewsPresenter!
    
    override func setup() {
        super.setup()
        presenter = NewsPresenter(view: self)
        setupUI()
        presenter.viewDidLoad()
        addLeftBarButton(image: #imageLiteral(resourceName: "profile") , selector: #selector(handleProfile))
        addRightBarButton(image: #imageLiteral(resourceName: "plus"), with: #selector(handleAdd))
    }
    
    @objc private func handleProfile() {
        performSegue(withIdentifier: NewsVCConstants.ProfileVCSegue, sender: nil)
    }
    
    
    @objc private func handleAdd() {
        print("AddNews")
        performSegue(withIdentifier: NewsVCConstants.AddNewsVCSegue, sender: nil)
    }
    
    private func setupUI() {
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(tableView)
        tableView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        
        tableView.register(UINib(nibName: NewsVCConstants.NewsCell, bundle: nil), forCellReuseIdentifier: NewsVCConstants.NewsCell)
        tableView.backgroundView = UIImageView(image: #imageLiteral(resourceName: "Background"))
        navigationItem.title = "Home"
        tableView.tableFooterView = UIView()
        tableView.refreshControl = refresher
        tableView.separatorStyle = .none
    }
    
    
    @objc private func handleRefresh() {
        refresher.endRefreshing()
        presenter.viewDidLoad()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == NewsVCConstants.AddNewsVCSegue {
            if let vc = segue.destination as? AddUpdateNewsVC {
                vc.news = sender as? NewsDTO
            }
        }
    }
}
