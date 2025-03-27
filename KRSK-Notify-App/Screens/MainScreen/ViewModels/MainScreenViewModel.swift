//
//  MainScreenViewModel.swift
//  KRSK-Notify-App
//
//  Created by SSDHDDQ on 21.03.2025.
//

import Foundation
import MapKit

final class MainScreenViewModel: ObservableObject {
    @Published var showEventList: Bool = false
    @Published var isShowingInfo: Bool = false
    @Published var isShowingSettings: Bool = false
    //MyPos - Nil
    @Published var isShowingList: Bool = false
    @Published var selectedEvent: Event?
    
    private let eventService = EventService()
    @Published var events: [Event] = []
    
    init() {
        loadEvents()
    }
    
    private func loadEvents() {
        eventService.loadEvents()
        events = eventService.events
    }
    
    func selectEvent(_ event: Event) {
        selectedEvent = event
        isShowingList = false
    }
}
