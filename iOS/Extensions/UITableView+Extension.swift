//
//  UITableView+Extension.swift
//  NewsApp
//
//  Created by Mina Shehata on 1/4/19.
//  Copyright © 2019 Mina Shehata. All rights reserved.
//

import UIKit

extension IndexPath {
    static func fromRow(_ row: Int) -> IndexPath {
        return IndexPath(row: row, section: 0)
    }
}

extension UITableView {
    func applyChanges(deletions: [Int], insertions: [Int], updates: [Int]) {
        beginUpdates()
        deleteRows(at: deletions.map(IndexPath.fromRow), with: .automatic)
        insertRows(at: insertions.map(IndexPath.fromRow), with: .automatic)
        reloadRows(at: updates.map(IndexPath.fromRow), with: .automatic)
        endUpdates()
    }
}

