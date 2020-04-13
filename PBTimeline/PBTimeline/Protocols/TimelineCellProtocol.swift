//
//  TimelineCellProtocol.swift
//  PBTimeline
//
//  Created by Pablo Blanco González on 15/02/2020.
//  Copyright © 2020 Pablo Blanco. All rights reserved.
//

import UIKit

protocol TimelineCellProtocol: UITableViewCell {
    var eventTitleLabel: UILabel! { get set }
    var eventDescriptionLabel: UILabel? { get set }
    var delegate: TimelineEventDelegate? { get set }
    var event: TimelineEventProtocol? { get set }
    func setEvent(_ event: TimelineEventProtocol, position: EventTimelinePosition)
}
