//
//  Array+Utils.swift
//  PBTimeline
//
//  Created by Pablo Blanco González on 25/06/2019.
//  Copyright © 2019 Mubiquo. All rights reserved.
//

import Foundation

/// Add some array utilities
extension Array {
    // Overwrites subscript to get safe access to an array index
    subscript (safe index: Int) -> Element? {
        return self.indices ~= index ? self[index] : nil
    }
}

extension Array where Element == TimelineEventProtocol {
    func sortedByDateInSections(direction: TimelineDirection) -> [(key: String, value: [TimelineEventProtocol])] {
        let eventData = Dictionary(grouping: self) { (event) -> String in
            return event.startDate.dateHashString ?? ""
        }
        
        switch direction {
        case .upBottom:
            return eventData.sorted(by: { $0.0 < $1.0 })
        case .bottomUp:
            return eventData.sorted(by: { $0.0 > $1.0 })
        }
    }
    
    func sortedByDate(direction: TimelineDirection) -> [TimelineEventProtocol] {
        switch direction {
        case .upBottom:
            return self.sorted(by: { $0.startDate < $1.startDate })
        case .bottomUp:
            return self.sorted(by: { $0.startDate > $1.startDate })
        }
    }
    
    func position(forIndex index: Int) -> TimelinePosition {
        switch index {
        case 0:
            return .top
        case count-1:
            return .bottom
        default:
            return .middle
        }
    }
}
