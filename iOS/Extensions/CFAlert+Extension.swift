//
//  CFAlert+Extension.swift
//  Template-iOS
//
//  Created by Mina Shehata on 1/3/19.
//  Copyright © 2019 Mina Shehata. All rights reserved.
//

import CFAlertViewController

public enum CFActionStyle: Int {
    case Default = 1
    case Cancel
    case Destructive
    
    var actionStyle: CFAlertAction.CFAlertActionStyle {
        switch self {
        case .Cancel:
            return .Cancel
        case .Destructive:
            return .Destructive
        case .Default:
            return .Default
        }
    }
    
}

public enum CFAlertStyle: Int {
    case notification = 1
    case alert
    case actionSheet
    
    var alertStyle:CFAlertViewController.CFAlertControllerStyle {
        switch self {
        case .notification:
            return .notification
        case .alert:
            return .alert
        case .actionSheet:
            return .actionSheet
        }
    }
    
}

extension UIViewController {
    
    public func CFAlert(title: String? = "", titleColor: UIColor = .black, message: String? = "", messageColor: UIColor = .darkGray, textAlignment: NSTextAlignment = .left, preferredStyle: CFAlertStyle, headerView: UIView? = UIView(), footerView: UIView? = UIView(), handler: CFAlertViewController.CFAlertViewControllerDismissBlock?, actions: CFAlertAction?...) {
        let alert = CFAlertViewController(title: title, titleColor: titleColor, message: message, messageColor: messageColor, textAlignment: textAlignment, preferredStyle: preferredStyle.alertStyle, headerView: headerView, footerView: footerView, didDismissAlertHandler: handler)
        actions.forEach {
            alert.addAction($0)
        }
        present(alert, animated: true, completion: nil)
        
        
    }
    
    public func createCFAction(title: String?, style: CFActionStyle = .Default, textAlignment: CFAlertAction.CFAlertActionAlignment = .center, backgroundColor: UIColor = .clear, textColor: UIColor = .black, handler: CFAlertAction.CFAlertActionHandlerBlock?) -> CFAlertAction {
        let action = CFAlertAction(title: title, style: style.actionStyle, alignment: textAlignment, backgroundColor: backgroundColor, textColor: textColor, handler: handler)
        
      return action
    }
}

