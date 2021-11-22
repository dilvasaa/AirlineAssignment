//
//  DateHandler.swift
//  Assignment
//
//  Created by Dileep vasa on 22/11/21.
//

import Foundation


struct DateHandler {
    
    var formatter = DateFormatter()
    
    func getDateInString(date: Date, format: String) -> String{
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
    
    func getDateFromString(date: String, format: String) -> Date? {
        formatter.dateFormat = format
        return formatter.date(from: date)
    }
}

