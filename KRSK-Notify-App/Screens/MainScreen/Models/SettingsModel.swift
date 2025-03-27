//
//  SettingsModel.swift
//  KRSK-Notify-App
//
//  Created by SSDHDDQ on 21.03.2025.
//

import Foundation

final class SettingsModel: ObservableObject {
    @Published var showWater = true
    @Published var showFire = true
    @Published var showElectricity = true
    @Published var showEmergency = true
    
}
