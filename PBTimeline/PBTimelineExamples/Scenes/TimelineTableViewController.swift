//
//  TimelineTableViewController.swift
//  PBTimeline
//
//  Created by Pablo Blanco González on 09/02/2020.
//  Copyright © 2020 Pablo Blanco. All rights reserved.
//

import UIKit
import PBTimeline

class TimelineTableViewController: UIViewController {

    @IBOutlet weak var timelineTableView: TimelineTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        timelineTableView.setup(events: events,
                                theme: timelineTheme,
                                customData: customData,
                                delegate: self)        
    }
    
    var timelineTheme: TimelineTheme = .regular(direction: .upBottom)
    var events: [TimelineEvent] = []
    var customData: TimelineCustomDataProtocol?
    
    init(timelineTheme: TimelineTheme, events: [TimelineEvent], customData: TimelineCustomDataProtocol? = nil) {
        self.timelineTheme = timelineTheme
        self.events = events
        self.customData = customData
        super.init(nibName: nil, bundle: nil)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension TimelineTableViewController: TimelineTableViewDelegate {
    func didSelect(event: TimelineEventProtocol) {
        print("didSelect")
    }
}
