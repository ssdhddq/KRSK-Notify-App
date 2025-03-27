//
//  SettingsView.swift
//  KRSK-Notify-App
//
//  Created by SSDHDDQ on 21.03.2025.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var settings: SettingsModel
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Уведомления")) {
                    Toggle("Получать уведомления", isOn: .constant(true))
                }

                Section(header: Text("Категории событий")) {
                    Toggle("Отключение воды", isOn: $settings.showWater)
                    Toggle("Пожар", isOn: $settings.showFire)
                    Toggle("Отключение света", isOn: $settings.showElectricity)
                    Toggle("Аварии", isOn: $settings.showEmergency)
                }
            }
            .navigationTitle("Настройки")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Закрыть") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Сохранить") {
                        
                        dismiss()
                    }
                }
            }
        }
    }
}
