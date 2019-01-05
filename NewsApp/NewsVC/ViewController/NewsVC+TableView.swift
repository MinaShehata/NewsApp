//
//  NewsVC+TableVew.swift
//  NewsApp
//
//  Created by Mina Shehata on 1/4/19.
//  Copyright © 2019 Mina Shehata. All rights reserved.
//

import UIKit

extension NewsVC: UITableViewDataSource, UITableViewDelegate  {
    // MARK:- tableView functions.......
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getNewsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsVCConstants.NewsCell, for: indexPath) as! NewsCell
        presenter.configure(cell: cell, at: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteSwipeAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self](action, _, completion) in
            
            self?.presenter.deleteNews(at: indexPath.row)
            // this the last parmaeter to tell the action to start execute....
            completion(true)
        }
        //delete the the action style
        deleteSwipeAction.image = UIImage(named: "trash")
        deleteSwipeAction.backgroundColor = UIColor.orangeColor
        let editSwipeAction = UIContextualAction(style: .normal, title: "Edit") { [weak self] (action, _, completionHandler) in
            guard let self = self else { return }
            self.performSegue(withIdentifier: NewsVCConstants.AddNewsVCSegue, sender: self.presenter.getEditedNews(at: indexPath.row))
            completionHandler(true)
        }
        //edit the the action style
        editSwipeAction.backgroundColor = UIColor.blueColor
        editSwipeAction.image = UIImage(named: "Edit")
        return UISwipeActionsConfiguration(actions: [deleteSwipeAction, editSwipeAction])
    }
    
}
