//
//  MockEvents.swift
//  KRSK-Notify-App
//
//  Created by SSDHDDQ on 21.03.2025.
//

import Foundation
import MapKit

final class MockEvents {
    static let events: [Event] = [
        Event(type: .water, title: "Отключение воды", coordinate: CLLocationCoordinate2D(latitude: 56.018, longitude: 92.9), dateCreated: Date()),
        Event(type: .electricity, title: "Отключение света", coordinate: CLLocationCoordinate2D(latitude: 56.01, longitude: 92.88), dateCreated: Date()),
        Event(type: .heating, title: "Пожар", coordinate: CLLocationCoordinate2D(latitude: 56.009, longitude: 92.86), dateCreated: Date()),
    ]
}
