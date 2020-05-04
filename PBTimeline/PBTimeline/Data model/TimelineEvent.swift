//
//  TimelineEvent.swift
//  PBTimeline
//
//  Created by Pablo Blanco González on 08/02/2020.
//  Copyright © 2020 Pablo Blanco. All rights reserved.
//

import UIKit

public protocol TimelineEventDelegate {
    func didSelect(event: TimelineEventProtocol)
}

public protocol TimelineEventProtocol {
    var id: Int { get }
    var startDate: Date { get set }
    var title: String { get set }
    var description: String? { get set }
    var category: TimelineEventCategoryProtocol { get set }
    var price: Float? { get set }
    var intervalDurationInSeconds: TimeInterval { get }
    var color: UIColor { get }
}

public struct TimelineEvent: TimelineEventProtocol {
    public var id: Int
    public var startDate: Date
    public var endDate: Date
    public var title: String
    public var description: String?
    public var category: TimelineEventCategoryProtocol
    public var price: Float?
    public var color: UIColor
    
    public init(id: Int, startDate: Date, endDate: Date = Date(), title: String, description: String?, category: TimelineEventCategoryProtocol, price: Float? = nil, color: UIColor = .white) {
        self.id = id
        self.startDate = startDate
        self.endDate = endDate
        self.title = title
        self.description = description
        self.category = category
        self.price = price
        self.color = color
    }
    
    public var intervalDurationInSeconds: TimeInterval {
        return endDate.timeIntervalSince(startDate)
    }
}

