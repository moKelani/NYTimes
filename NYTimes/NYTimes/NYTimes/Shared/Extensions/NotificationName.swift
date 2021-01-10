//
//  NotificationName.swift
//  NYTimes
//
//  Created by Mohamed Kelany on 10/01/2021.
//

import Foundation

protocol NotificationName {
    var name: Notification.Name { get }
}

extension RawRepresentable where RawValue == String, Self: NotificationName {
    var name: Notification.Name {
        return Notification.Name(rawValue)
    }
}

enum Notifications: String, NotificationName {
    case connected
    case notConnected
    case sortByTapped
    case searchTapped
}

