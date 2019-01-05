//
//  NewsCell.swift
//  NewsApp
//
//  Created by Mina Shehata on 1/4/19.
//  Copyright © 2019 Mina Shehata. All rights reserved.
//

import UIKit

// MARK:- Cell Presenter
protocol NewsCellView: class {
    func displayTitle(title: String)
    func displayDesc(description: String)
}


class NewsCell: UITableViewCell, NewsCellView {
   
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
   
    func displayTitle(title: String) {
        titleLabel.text = title
    }
    
    func displayDesc(description: String) {
        descriptionLabel.text = description
    }
    
    

    
}
