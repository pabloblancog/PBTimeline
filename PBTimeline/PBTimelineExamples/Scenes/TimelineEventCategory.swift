//
//  TimelineEventCategory.swift
//  PBTimelineExamples
//
//  Created by Pablo Blanco González on 13/04/2020.
//  Copyright © 2020 PabloBlanco. All rights reserved.
//

import UIKit
import PBTimeline

enum TimelineEventCategory: TimelineEventCategoryProtocol {
    case food
    case transport
    case home
    
    var icon: UIImage? {
        let imageName: String
        switch self {
        case .food:
            imageName = "ic_pizza"
        case .transport:
            imageName = "ic_burguer"
        case .home:
            imageName = "ic_coffee"
        }
        return UIImage(named: imageName)
    }
    
    var name: String {
        switch self {
        case .food:
            return "Pizza"
        case .transport:
            return "Burguer"
        case .home:
            return "Coffee"
        }
    }
}

enum TimelineProgressCategory: TimelineEventCategoryProtocol {
    case new
    case collected
    case intransit
    case delivered
    
    var icon: UIImage? {
        let imageName: String
        switch self {
        case .new:
            imageName = "ic_new"
        case .collected:
            imageName = "ic_collected"
        case .intransit:
            imageName = "ic_intransit"
        case .delivered:
            imageName = "ic_delivered"
        }
        return UIImage(named: imageName)
    }
    
    var name: String {
        switch self {
        case .new:
            return "New"
        case .collected:
            return "Collected"
        case .intransit:
            return "In transit"
        case .delivered:
            return "Delivered"
        }
    }
}

enum TimelineTimeTrackingCategory: TimelineEventCategoryProtocol {
    case work_start
    case work_end
    case work
    case lunch
    case breakfast
    case coffee
    case location_change
    
    var icon: UIImage? {
        let imageName: String
        switch self {
        case .work_start:
            imageName = "ic_work_start"
        case .work_end:
            imageName = "ic_work_end"
        case .work:
            imageName = "ic_work"
        case .lunch:
            imageName = "ic_lunch"
        case .breakfast:
            imageName = "ic_breakfast"
        case .coffee:
            imageName = "ic_coffee"
        case .location_change:
            imageName = "ic_location_change"
        }
        return UIImage(named: imageName)
    }
    
    var name: String {
        switch self {
        case .work_start:
            return "Work start"
        case .work_end:
            return "Work end"
        case .work:
            return "Work"
        case .lunch:
            return "Lunch"
        case .breakfast:
            return "Breakfast"
        case .coffee:
            return "Coffee"
        case .location_change:
            return "Location change"
        }
    }
}
