//
//  ListViewModel.swift
//  KRSK-Notify-App
//
//  Created by SSDHDDQ on 21.03.2025.
//

import SwiftUI
import MapKit

final class ListViewModel: ObservableObject {
    @Published var events: [Event] = MockEvents.events
}
