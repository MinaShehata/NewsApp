//
//  StretchyTableView.swift
//  NewsApp
//
//  Created by Mina Shehata on 1/5/19.
//  Copyright © 2019 Mina Shehata. All rights reserved.
//

import UIKit

class StretchyTableView: UITableView {

    var heightConstraint: NSLayoutConstraint?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let header = tableHeaderView else { return }
        
        if heightConstraint != nil {
            if let imageView = header.subviews.first as? UIImageView {
                heightConstraint = imageView.constraints.filter { $0.identifier == "height" }.first
            }
        }
        let offsetY = -(contentOffset.y + adjustedContentInset.top)
        heightConstraint?.constant = max(header.bounds.height, header.bounds.height + offsetY)
    }

}
