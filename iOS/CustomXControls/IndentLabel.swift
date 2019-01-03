//
//  IndentLabel.swift
//  IntermediateTraining
//
//  Created by Mina Shehata on 10/25/18.
//  Copyright © 2018 Mina Shehata. All rights reserved.
//

import UIKit

class IndentLabel: UILabel {
    
    override func drawText(in rect: CGRect) {
        let customRect = CGRect(x: 16, y: 0, width: self.frame.width, height: self.frame.height)
        super.drawText(in: customRect)
    }
    
}
