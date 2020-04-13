//
//  TimelineTableViewDataSourceProtocol.swift
//  PBTimeline
//
//  Created by Pablo Blanco González on 16/02/2020.
//  Copyright © 2020 Pablo Blanco. All rights reserved.
//

import UIKit

protocol TimelineTableViewDataSourceProtocol: UITableViewDataSource {
    var events: [TimelineEventProtocol] { get set }
}
