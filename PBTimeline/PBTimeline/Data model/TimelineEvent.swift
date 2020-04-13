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
    var id: Int { get set }
    var date: Date { get set }
    var title: String { get set }
    var description: String? { get set }
    var category: TimelineEventCategoryProtocol { get set }
    var price: Float? { get set }
}

public struct TimelineEvent: TimelineEventProtocol {
    public var id: Int
    public var date: Date
    public var title: String
    public var description: String?
    public var category: TimelineEventCategoryProtocol
    public var price: Float?
    
    public init(id: Int, date: Date, title: String, description: String?, category: TimelineEventCategoryProtocol, price: Float? = nil) {
        self.id = id
        self.date = date
        self.title = title
        self.description = description
        self.category = category
        self.price = price
    }
}

