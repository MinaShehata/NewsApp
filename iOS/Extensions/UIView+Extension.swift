//
//  UIView+Extension.swift
//  aman-user-ios
//
//  Created by Mina Shehata Gad on 6/7/18.
//  Copyright © 2018 Mina Shehata Gad. All rights reserved.
//

import UIKit
import AVFoundation

extension UIView {
    
    public func fillSuperView(padding: UIEdgeInsets = .zero) {
        
        anchor(top: superview?.topAnchor, leading: superview?.leadingAnchor, bottom: superview?.bottomAnchor, trailing: superview?.trailingAnchor)
    }
    
    public func anchorSize(to view: UIView, size: CGSize = .zero, center: Bool = false) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: size.width) .isActive = true
        heightAnchor.constraint(equalToConstant: size.height).isActive = true
        
        if center {
            centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        }
        
    }
    public func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top { topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true }
        if let leading = leading {leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true }
        if let bottom = bottom {bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true }
        if let trailing = trailing { trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive =  true }
        
        if size.width != 0 { widthAnchor.constraint(equalToConstant: size.width).isActive = true }
        if size.height != 0 { heightAnchor.constraint(equalToConstant: size.height).isActive = true }
    }
    
    public func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
}

