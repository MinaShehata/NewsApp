//
//  Transitioning.swift
//  Template-iOS
//
//  Created by Mina Shehata on 1/3/19.
//  Copyright © 2019 Mina Shehata. All rights reserved.
//

import UIKit

extension UIStoryboard {
    static func storyboard(with name: String) -> UIStoryboard {
        return UIStoryboard(name: name, bundle: nil)
    }
}

public final class Transition {

    class func goToStoryboard(with name: String) {
        guard let window = UIApplication.shared.keyWindow else { return }
        let vc = UIStoryboard.storyboard(with: name).instantiateInitialViewController()
        window.rootViewController = vc
        Transition.transition(with: window)
    }
    
    
    class func transition(with window: UIWindow) {
        let transition = CATransition()
        transition.duration = 0.4
        transition.type = CATransitionType.fade
        window.layer.add(transition, forKey: kCATransition)
    }
    

}
