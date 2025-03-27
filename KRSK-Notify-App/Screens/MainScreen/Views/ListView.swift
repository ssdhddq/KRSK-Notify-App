//
//  ListView.swift
//  KRSK-Notify-App
//
//  Created by SSDHDDQ on 21.03.2025.
//

import SwiftUI

struct ListView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = ListViewModel()
    var filteredEvents: [Event]
    var onEventSelected: (Event) -> Void
    
    var body: some View {
        NavigationStack {
            List(filteredEvents) { event in
                ListCellView(event: event)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        onEventSelected(event)
                        dismiss()
                    }
            }
            .navigationTitle("Список аварий")
        }
    }
}
