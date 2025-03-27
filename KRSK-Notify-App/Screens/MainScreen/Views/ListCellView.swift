//
//  ListCellView.swift
//  KRSK-Notify-App
//
//  Created by SSDHDDQ on 21.03.2025.
//

import SwiftUI
import MapKit
import CoreLocation

struct ListCellView: View {
    let event: Event
    @State private var address: String = "Загрузка адреса..."
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Image(systemName: event.type.icon)
                    .foregroundColor(event.type.color)
                Text(event.title)
                    .fontWeight(.semibold)
            }
            Text(address)
                .font(.subheadline)
                .foregroundColor(.secondary)
            Text("🕐 \(formatted(event.dateCreated))")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding(.vertical, 4)
        .onAppear {
            getAddress(from: event.coordinate)
        }
    }
    
    func formatted(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm"
        return formatter.string(from: date)
    }
    
    func getAddress(from coordinate: CLLocationCoordinate2D) {
        let geocoder = CLGeocoder()
        let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)

        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            guard let placemark = placemarks?.first else {
                address = "Адрес не найден"
                return
            }

            let street = placemark.thoroughfare ?? ""
            let number = placemark.subThoroughfare ?? ""
            let name = placemark.name ?? ""
            let subLocality = placemark.subLocality ?? ""
            let city = placemark.locality ?? ""
            let region = placemark.administrativeArea ?? ""

            if !street.isEmpty || !number.isEmpty {
                address = "\(street) \(number), \(city)"
            } else if !name.isEmpty {
                address = "\(name), \(city)"
            } else if !subLocality.isEmpty {
                address = "\(subLocality), \(city)"
            } else {
                address = city.isEmpty ? "Неизвестный адрес" : city
            }
        }
    }
}

#Preview {
    ListCellView(event: Event(type: .water, title: "Отключение воды", coordinate: CLLocationCoordinate2D(latitude: 56.018, longitude: 92.9), dateCreated: Date()))
}
