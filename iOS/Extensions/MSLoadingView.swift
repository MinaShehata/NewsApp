//
//  MSLoadingView.swift
//  Template-iOS
//
//  Created by Mina Shehata on 1/3/19.
//  Copyright © 2019 Mina Shehata. All rights reserved.
//

import UIKit

protocol SpinnerView {
    func ShowSpinner()
    func HideSpinner()
}

class MSLoadingView: UIViewXRadialGradient {

    private let blackView: UIViewX = {
        let bv = UIViewX()
        bv.backgroundColor = .black
        bv.alpha = 0.8
        bv.cornerRadius = 15
        bv.shadowColor = .black
        bv.shadowOffset = CGSize(width: 0.5, height: 0.5)
        bv.shadowRadius = 4
        bv.shadowOpacity = 0.5
        return bv
    }()
    
    fileprivate let activityIndicator: UIActivityIndicatorView = {
        let aiv = UIActivityIndicatorView(style: .whiteLarge)
        aiv.hidesWhenStopped = true
        return aiv
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .clear
        InsideColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5017390839)
        OutsideColor = #colorLiteral(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.6)
        
        addSubview(blackView)
        blackView.anchorSize(to: self, size: CGSize(width: 100, height: 100), center: true)
        
        blackView.addSubview(activityIndicator)
        activityIndicator.anchorSize(to: blackView, size: .zero, center: true)
    }
}


extension UIViewController {
    
    public func StartLoading() {
        DispatchQueue.main.async { [weak self] in
            self?.showApplicationNetworkActivityIndicator()
            guard let window = UIApplication.shared.keyWindow else { return }
            let view = MSLoadingView(frame: window.frame)
            window.addSubview(view)
            view.activityIndicator.startAnimating()
            Transition.transition(with: window)
        }
    }
    
    public func StopLoading() {
        DispatchQueue.main.async { [weak self] in
            guard let window = UIApplication.shared.keyWindow else { return }
            self?.hideApplicationNetworkActivityIndicator()
            window.subviews.forEach {
                if let msLoaderView = $0 as? MSLoadingView {
                    msLoaderView.activityIndicator.stopAnimating()
                    msLoaderView.removeFromSuperview()
                }
            }
            Transition.transition(with: window)
        }
    }
    
    // MARK: - Helpers
    private func showApplicationNetworkActivityIndicator() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    private func hideApplicationNetworkActivityIndicator() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
}

