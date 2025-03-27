//
//  MapViewModel.swift
//  KRSK-Notify-App
//
//  Created by SSDHDDQ on 21.03.2025.
//

import MapKit
import SwiftUI

final class MapViewModel: ObservableObject {
    let krasnoyarskCoordinate = CLLocationCoordinate2D(latitude: 56.0153, longitude: 92.8932)

    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 56.0153, longitude: 92.8932),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )
    
    @Published var events: [Event] = MockEvents.events

    func focusOn(coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
    }

    func zoomIn() {
        region.span = MKCoordinateSpan(
            latitudeDelta: max(region.span.latitudeDelta * 0.5, 0.001),
            longitudeDelta: max(region.span.longitudeDelta * 0.5, 0.001)
        )
    }
    
    func zoomOut() {
        region.span = MKCoordinateSpan(
            latitudeDelta: min(region.span.latitudeDelta * 2, 180),
            longitudeDelta: min(region.span.longitudeDelta * 2, 180)
        )
    }
}
