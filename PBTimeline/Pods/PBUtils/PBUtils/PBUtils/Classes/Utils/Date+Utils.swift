//
//  Date+Utils.swift
//  PBUtils
//
//  Created by Pablo Blanco González on 11/04/2020.
//  Copyright © 2020 PabloBlanco. All rights reserved.
//


import Foundation

public extension Date {
    
    /*
    E..EEE  Tue Abbreviated Day of week name, format style.
    EEEE    Tuesday Wide
    EEEEE   T   Narrow
    EEEEEE  Tu  Short
    */
    
    enum Format: String {
        case defaultDate = "HH:mm dd/MM/yyyy"
        case time = "hh:mm"
        case timeAMPM = "hh:mm a"
        case literalDate = "EEEE, dd MMM yyyy"
        case weekday = "EEE"
        case weekdaySymbol = "EEEEE"
        case day = "dd"
        case iso8601 = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
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

    var daySymbolString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = Format.weekdaySymbol.rawValue
        return formatter.string(from: self)
    }
    
    func isSameDay(than date: Date) -> Bool {
        return Calendar.current.isDate(self, inSameDayAs: date)
    }
    
    func addingHours(hours: Int) throws -> Date {
        let calendar = Calendar.current
        guard let date = calendar.date(byAdding: .hour, value: hours, to: self) else {
            throw NSError(domain: "", code: 1, userInfo: nil)
        }
        return date
    }

    func addingDays(days: Int) throws -> Date {
        return try addingHours(hours: 24*days)
    }
    
    var dateISO8601Full: String {
        let formatter = DateFormatter()
        formatter.dateFormat = Format.iso8601.rawValue
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter.string(from: self)
    }
    
    func isToday(_ weekday: Weekday) -> Bool {
        let calendar = Calendar.current
        return calendar.component(.weekday, from: self) == weekday.rawValue
    }
    
    var isToday: Bool {
        return isSameDay(than: Date())
    }

    func next(_ weekday: Weekday, direction: Calendar.SearchDirection = .forward, considerToday: Bool = false) -> Date {
        let calendar = Calendar(identifier: .gregorian)
        let components = DateComponents(weekday: weekday.rawValue)

        if considerToday && calendar.component(.weekday, from: self) == weekday.rawValue {
            return self
        }

        return calendar.nextDate(after: self,
                                 matching: components,
                                 matchingPolicy: .nextTime,
                                 direction: direction)!
    }

    enum Weekday: Int {
        case sunday = 1, monday, tuesday, wednesday, thursday, friday, saturday
    }
}
