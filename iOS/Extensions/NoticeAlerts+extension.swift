//
//  NoticeAlerts+extension.swift
//  NewsApp
//
//  Created by Mina Shehata on 1/4/19.
//  Copyright © 2019 Mina Shehata. All rights reserved.
//

import NoticeBar

extension UIViewController {
    
    
    
    public func InfoAlert(messaage: String , textColor: UIColor = UIColor.white, backgroundColor: UIColor = UIColor.yellow, completion:  (() -> ())? = nil) {
        let noticeBar = NoticeBar(title: messaage, defaultType: .info)
        noticeBar.titleLabel?.textColor = textColor
        noticeBar.backgroundColor = backgroundColor
        /// duration : How long the noticeBar will stay. And it will dismiss automatically.
        /// completed :optional. When the noticeBar dismissed, what you want to do, nothing type nil.
        noticeBar.show(duration: 2, completed: { (finished) in
            if finished {
                if let completion = completion {
                    completion()
                }
            }
        })
    }
    
    public func ErrorAlert(messaage: String, textColor: UIColor = UIColor.white, backgroundColor: UIColor = UIColor.red, completion: (() -> ())? = nil) {
        let noticeBar = NoticeBar(title: messaage, defaultType: .error)
        noticeBar.titleLabel?.textColor = textColor
        noticeBar.backgroundColor = backgroundColor
        /// duration : How long the noticeBar will stay. And it will dismiss automatically.
        /// completed :optional. When the noticeBar dismissed, what you want to do, nothing type nil.
        noticeBar.show(duration: 2, completed: { (finished) in
            if finished {
                if let completion = completion {
                    completion()
                }
            }
        })
    }
    
    
    public func SuccessAlert(messaage: String, textColor: UIColor = UIColor.white, backgroundColor: UIColor = UIColor.blue, completion: (() -> ())? = nil) {
        let noticeBar = NoticeBar(title: messaage, defaultType: .success)
        noticeBar.titleLabel?.textColor = textColor
        noticeBar.backgroundColor = backgroundColor
        /// duration : How long the noticeBar will stay. And it will dismiss automatically.
        /// completed :optional. When the noticeBar dismissed, what you want to do, nothing type nil.
        noticeBar.show(duration: 2, completed: { (finished) in
            if finished {
                if let completion = completion {
                    completion()
                }
            }
        })
    }
}
