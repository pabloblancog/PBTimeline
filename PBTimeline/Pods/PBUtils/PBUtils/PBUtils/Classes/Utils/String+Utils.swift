//
//  String+Utils.swift
//  PBUtils
//
//  Created by Pablo Blanco González on 19/04/2020.
//  Copyright © 2020 PabloBlanco. All rights reserved.
//

import Foundation

public extension String {
    
    func toDate(format: Date.Format = .defaultDate) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        return dateFormatter.date(from: self)
    }
    
    func toDateISO8601Full() -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = Date.Format.iso8601.rawValue
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter.date(from: self)
    }
    
    func isValidEmail() -> Bool {
        return count > 0 && NSPredicate(format: "self matches %@", "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,64}").evaluate(with: self)
    }
}
