//
//  String+extension.swift
//  IntermediateTraining
//
//  Created by Mina Shehata on 11/1/18.
//  Copyright © 2018 Mina Shehata. All rights reserved.
//

import Foundation

extension String {
    func getDateFromString() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC") // cairo time zone.......
        return dateFormatter.date(from: self)
    }
    
}

extension Date {
    func convertDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyy"
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
}
