//
//  MapView.swift
//  KRSK-Notify-App
//
//  Created by SSDHDDQ on 21.03.2025.
//

import SwiftUI
import MapKit

struct MapView: View {
    @StateObject var viewModel = MapViewModel()
    var filteredEvents: [Event]
    var selectedEvent: Event?
    
    var body: some View {
        ZStack(alignment: .trailing) {
            Map(coordinateRegion: $viewModel.region,
                annotationItems: filteredEvents) { event in
                MapAnnotation(coordinate: event.coordinate) {
                    VStack {
                        Image(systemName: event.type.icon)
                            .foregroundColor(.white)
                            .padding(8)
                            .background(
                                event.id == selectedEvent?.id 
                                    ? event.type.color.opacity(0.8) 
                                    : event.type.color
                            )
                            .clipShape(Circle())
                        Text(event.title)
                            .font(.caption)
                            .fixedSize()
                    }
                }
            }
            .onChange(of: selectedEvent) { newEvent in
                if let event = newEvent {
                    viewModel.focusOn(coordinate: event.coordinate)
                }
            }
            
            VStack(spacing: 10) {
                ButtonsInMainView(imageName: "plus.magnifyingglass", action: {
                    viewModel.zoomIn()
                })
                
                ButtonsInMainView(imageName: "minus.magnifyingglass", action: {
                    viewModel.zoomOut()
                })
            }
            .padding(.trailing, 16)
            .padding(.vertical, 160) // Располагаем между верхними и нижними кнопками
        }
    }
}
