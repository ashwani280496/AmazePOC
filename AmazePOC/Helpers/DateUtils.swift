//
//  DateUtils.swift
//  AmazePOC
//
//  Created by Ashwani Kumar on 18/07/19.
//  Copyright © 2019 Djubo. All rights reserved.
//

import Foundation

class DateUtils {
    
    static let defaultDateFormat = "dd/MM/yyyy"
    
    static func getDateObject(format : String, dateStr : String) -> Date{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        if let date = dateFormatter.date(from: dateStr){
            return date
        }
        return Date()
    }
    
    // this method converts the date object to String fromat
    static func getStringFromDate(date: Date, format: String) -> String{
        let dateFormatter = DateFormatter.init()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
        
    }
}
