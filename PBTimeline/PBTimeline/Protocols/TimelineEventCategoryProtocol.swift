//
//  TimelineEventCategory.swift
//  PBTimeline
//
//  Created by Pablo Blanco González on 14/03/2020.
//  Copyright © 2020 Pablo Blanco. All rights reserved.
//

import UIKit

public protocol TimelineEventCategoryProtocol {
    var icon: UIImage? { get }
    var name: String { get }
}
