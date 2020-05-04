//
//  TimelineTabViewController.swift
//  PBTimeline
//
//  Created by Pablo Blanco González on 25/02/2020.
//  Copyright © 2020 Pablo Blanco. All rights reserved.
//

import UIKit
import PBTimeline

class TimelineTabViewController: UITabBarController, UITabBarControllerDelegate {
    
    var events: [TimelineEvent] {
        do {
        return [TimelineEvent(id: 1,
                              startDate: Date(),
                              endDate: try Date().addingHours(hours: 1),
                              title: "New York Burguer",
                              description: "Description for event 1",
                              category: TimelineEventCategory.transport,
                              price: 10.0),
                
                TimelineEvent(id: 2,
                              startDate: try Date().addingDays(days: 1),
                              endDate: try Date().addingDays(days: 1).addingHours(hours: 1),
                              title: "Domino's Pizza",
                              description: "Description for event 2",
                              category: TimelineEventCategory.food,
                              price: 15.50),
                
                TimelineEvent(id: 3,
                              startDate: try Date().addingDays(days: 1),
                              endDate: try Date().addingDays(days: 1).addingHours(hours: 1),
                              title: "Starbucks",
                              description: "Description for event 3. This is a very long description to test what happens if a long line is included on the cell... Will it get higher?",
                              category: TimelineEventCategory.home,
                              price: 6.30),
                
                TimelineEvent(id: 4,
                              startDate: try Date().addingDays(days: 2),
                              endDate: try Date().addingDays(days: 2).addingHours(hours: 1),
                              title: "Pizza Hut",
                              description: "Description for event 4",
                              category: TimelineEventCategory.food,
                              price: 17.99),
                
                TimelineEvent(id: 5,
                              startDate: try Date().addingDays(days: 2),
                              endDate: try Date().addingDays(days: 2).addingHours(hours: 1),
                              title: "Espresso",
                              description: "Description for event 5",
                              category: TimelineEventCategory.home,
                              price: 1.10),
                
                TimelineEvent(id: 6,
                              startDate: try Date().addingDays(days: 2),
                              endDate: try Date().addingDays(days: 2).addingHours(hours: 1),
                              title: "Michael's burguer",
                              description: "Description for event 6",
                              category: TimelineEventCategory.transport,
                              price: 12.0),
                
                TimelineEvent(id: 7,
                              startDate: try Date().addingDays(days: 3),
                              endDate: try Date().addingDays(days: 3).addingHours(hours: 1),
                              title: "McDonald's",
                              description: "Description for event 7",
                              category: TimelineEventCategory.transport,
                              price: 7.99),
                
                TimelineEvent(id: 8,
                              startDate: try Date().addingDays(days: 3),
                              endDate: try Date().addingDays(days: 3).addingHours(hours: 1),
                              title: "Coffee house",
                              description: "Description for event 8",
                              category: TimelineEventCategory.home,
                              price: 1.60),
                
                TimelineEvent(id: 9,
                              startDate: try Date().addingDays(days: 4),
                              endDate: try Date().addingDays(days: 4).addingHours(hours: 1),
                              title: "Pizza garden",
                              description: "Description for event 9",
                              category: TimelineEventCategory.food,
                              price: 24.60)]
        } catch {
            return []
        }
    }
    
    var deliveryEvents: [TimelineEvent] {
        do {
            return [TimelineEvent(id: 1,
                                  startDate: Date(),
                                  endDate: try Date().addingHours(hours: 1),
                                  title: TimelineProgressCategory.new.name,
                                  description: "08:30h",
                                  category: TimelineProgressCategory.new),
                    
                    TimelineEvent(id: 2,
                                  startDate: try Date().addingDays(days: 1),
                                  endDate: try Date().addingDays(days: 1).addingHours(hours: 1),
                                  title: TimelineProgressCategory.collected.name,
                                  description: "09:30h",
                                  category: TimelineProgressCategory.collected),
                    
                    TimelineEvent(id: 3,
                                  startDate: try Date().addingDays(days: 1),
                                  endDate: try Date().addingDays(days: 1).addingHours(hours: 1),
                                  title: TimelineProgressCategory.intransit.name,
                                  description: "09:45h",
                                  category: TimelineProgressCategory.intransit),
                    
                    TimelineEvent(id: 4,
                                  startDate: try Date().addingDays(days: 2),
                                  endDate: try Date().addingDays(days: 2).addingHours(hours: 1),
                                  title: TimelineProgressCategory.delivered.name,
                                  description: "11:20h",
                                  category: TimelineProgressCategory.delivered)]
        } catch {
            return []
        }
    }
    var timeTrackingEvents: [TimelineEvent] {        
        let magenta = UIColor.appleRingMagenta
        let blue = UIColor.appleRingBlue
        let green = UIColor.appleRingGreen
        
        return [TimelineEvent(id: 1,
                              startDate: Date(),
                              endDate: try! Date().addingMinutes(minutes: 30),
                              title: "Workday start",
                              description: "08:00h - 08.30h",
                              category: TimelineTimeTrackingCategory.work_start,
                              color: blue),
                
                TimelineEvent(id: 2,
                              startDate: try! Date().addingMinutes(minutes: 30),
                              endDate: try! Date().addingMinutes(minutes: 60),
                              title: "Coffee break",
                              description: "08:30h - 09.00h",
                              category: TimelineTimeTrackingCategory.coffee,
                              color: green),
                
                TimelineEvent(id: 3,
                              startDate: try! Date().addingMinutes(minutes: 60),
                              endDate: try! Date().addingHours(hours: 5).addingMinutes(minutes: 30),
                              title: "Work",
                              description: "09:00h - 13.30h",
                              category: TimelineTimeTrackingCategory.work,
                              color: blue),
                
                TimelineEvent(id: 4,
                              startDate: try! Date().addingHours(hours: 5).addingMinutes(minutes: 30),
                              endDate: try! Date().addingHours(hours: 6).addingMinutes(minutes: 30),
                              title: "Lunch",
                              description: "13.30h - 14.30h",
                              category: TimelineTimeTrackingCategory.lunch,
                              color: magenta),
                
                TimelineEvent(id: 5,
                              startDate: try! Date().addingHours(hours: 6).addingMinutes(minutes: 30),
                              endDate: try! Date().addingHours(hours: 8).addingMinutes(minutes: 30),
                              title: "Work",
                              description: "14:30h - 16.30h",
                              category: TimelineTimeTrackingCategory.work,
                              color: blue),
                
                TimelineEvent(id: 6,
                              startDate: try! Date().addingHours(hours: 8).addingMinutes(minutes: 30),
                              endDate: try! Date().addingHours(hours: 9),
                              title: "Location change: Banco Santander",
                              description: "16.30h - 17.00h",
                              category: TimelineTimeTrackingCategory.location_change,
                              color: green),
                
                TimelineEvent(id: 7,
                              startDate: try! Date().addingHours(hours: 9),
                              endDate: try! Date().addingHours(hours: 10),
                              title: "Work",
                              description: "17:00h - 18.00h",
                              category: TimelineTimeTrackingCategory.work_end,
                              color: blue)]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setRightBarButton(UIBarButtonItem(title: "New event",
                                                              style: .plain,
                                                              target: self,
                                                              action: #selector(createNewEvent(sender:))),
                                              animated: true)
        
        
        self.delegate = self
        
        let spendingData = SpendingData()
        
        let timelineSpendingsVC = TimelineTableViewController(timelineTheme: .compact(direction: .bottomUp, needsHeaders: true), events: events, customData: spendingData)
        let timelineMinimalVC = TimelineTableViewController(timelineTheme: .minimal(direction: .bottomUp), events: events)
        let timelineRegularVC = TimelineTableViewController(timelineTheme: .regular(direction: .bottomUp), events: events)
        let timelineDeliveryVC = TimelineTableViewController(timelineTheme: .regular(direction: .upBottom), events: deliveryEvents)
        let timelineTimeTrackingVC = TimelineTableViewController(timelineTheme: .compact(direction: .upBottom, needsHeaders: false), events: timeTrackingEvents)
        
        timelineSpendingsVC.tabBarItem = UITabBarItem(title: "Spendings", image: nil, selectedImage: nil)
        timelineMinimalVC.tabBarItem = UITabBarItem(title: "Minimal", image: nil, selectedImage: nil)
        timelineRegularVC.tabBarItem = UITabBarItem(title: "Regular", image: nil, selectedImage: nil)
        timelineDeliveryVC.tabBarItem = UITabBarItem(title: "Delivery", image: nil, selectedImage: nil)
        timelineTimeTrackingVC.tabBarItem = UITabBarItem(title: "Time tracking", image: nil, selectedImage: nil)
        
        self.viewControllers = [timelineSpendingsVC, timelineMinimalVC, timelineRegularVC, timelineDeliveryVC, timelineTimeTrackingVC]
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("tabbar")
    }
    
    
    @objc func createNewEvent(sender: UIBarButtonItem) {
        self.present(NewEventViewController.loadFromNib(), animated: true, completion: nil)
    }
}
