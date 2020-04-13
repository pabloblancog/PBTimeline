//
//  Date+Utils.swift
//  PBUtils
//
//  Created by Pablo Blanco González on 11/04/2020.
//  Copyright © 2020 PabloBlanco. All rights reserved.
//


import Foundation

extension Date {
    
    enum Format: String {
        case defaultDate = "HH:mm dd/MM/yyyy"
        case time = "hh:mm"
        case timeAMPM = "hh:mm a"
        case literalDate = "EEEE, dd MMM yyyy"
        case weekday = "EEE"
        case day = "dd"
    }

    var dateComponents: DateComponents {
        return Calendar.current.dateComponents([.day, .month, .year], from: self)
    }
    
    var dateHashString: String? {
        guard let year = dateComponents.year, let month = dateComponents.month, let day = dateComponents.day else {
            return nil
        }
        return "\(year)\(month)\(day)"
    }
    
    var timeString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = Format.time.rawValue
        return formatter.string(from: self)
    }

    var timeAMPMString: String {
        let formatter = DateFormatter()
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        formatter.dateFormat = Format.timeAMPM.rawValue
        return formatter.string(from: self)
    }
    
    var dateString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = Format.literalDate.rawValue
        return formatter.string(from: self)
    }
    
    var weekdayString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = Format.weekday.rawValue
        return formatter.string(from: self)
    }
    
    var dayString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = Format.day.rawValue
        return formatter.string(from: self)
    }
    
    func isSameDay(than date: Date) -> Bool {
        return Calendar.current.isDate(self, inSameDayAs: date)
    }
    
    func addingHours(hours: Int) -> Date? {
        let calendar = Calendar.current
        return calendar.date(byAdding: .hour, value: hours, to: self)
    }

    func addingDays(days: Int) -> Date? {
        return addingHours(hours: 24*days)
    }
}
