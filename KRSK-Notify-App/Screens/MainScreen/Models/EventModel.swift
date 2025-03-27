//
//  EventModel.swift
//  KRSK-Notify-App
//
//  Created by SSDHDDQ on 21.03.2025.
//

import SwiftUI
import CoreLocation

struct Event: Identifiable, Codable, Equatable {
    let id: UUID
    let type: EventType
    let title: String
    private let latitude: Double
    private let longitude: Double
    let dateCreated: Date
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case type
        case title
        case latitude
        case longitude
        case dateCreated
    }
    
    init(type: EventType, title: String, coordinate: CLLocationCoordinate2D, dateCreated: Date) {
        self.id = UUID()
        self.type = type
        self.title = title
        self.latitude = coordinate.latitude
        self.longitude = coordinate.longitude
        self.dateCreated = dateCreated
    }
}

enum EventType: String, Codable {
    case water, electricity, heating, emergency
    
    var color: Color {
        switch self {
        case .water: return .blue
        case .electricity: return .yellow
        case .heating: return .red
        case .emergency: return .orange
        }
    }

    var icon: String {
        switch self {
        case .water: return "drop.fill"
        case .electricity: return "bolt.fill"
        case .heating: return "flame.fill"
        case .emergency: return "exclamationmark.triangle.fill"
        }
    }
}
