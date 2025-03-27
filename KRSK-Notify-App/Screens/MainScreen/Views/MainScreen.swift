//
//  ContentView.swift
//  KRSK-Notify-App
//
//  Created by SSDHDDQ on 21.03.2025.
//

import SwiftUI

struct MainScreen: View {
    @StateObject var viewModel = MainScreenViewModel()
    @ObservedObject var settings = SettingsModel()
    
    var filteredEvents: [Event] {
        viewModel.events.filter { event in
            switch event.type {
            case .water: return settings.showWater
            case .heating: return settings.showFire
            case .electricity: return settings.showElectricity
            case .emergency: return settings.showEmergency
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                MapView(
                    filteredEvents: filteredEvents,
                    selectedEvent: viewModel.selectedEvent
                )
                
                VStack {
                    Text("KRSK Notify")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .cornerRadius(10)
                        .padding(.top, 60)
                    
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    VStack(spacing: 10) {
                        ButtonsInMainView(imageName: "info.circle.fill", action: {
                            viewModel.isShowingInfo = true
                        })
                        
                        ButtonsInMainView(imageName: "gearshape.fill", action: {
                            viewModel.isShowingSettings = true
                        })
                    }
                    .padding(.trailing, 16)
                    .padding(.top, 60)
                }
                
                HStack {
                    Spacer()
                    VStack(spacing: 10) {
                        Spacer()
                        
                        ButtonsInMainView(imageName: "location.north.fill", action: {
                            print("MyPosition")
                        })
                        
                        ButtonsInMainView(imageName: "list.dash", action: {
                            viewModel.isShowingList = true
                        })
                    }
                    .padding(.trailing, 16)
                    .padding(.bottom, 60)
                }
            }
            .ignoresSafeArea(.all)
            
        }
        
        .sheet(isPresented: $viewModel.isShowingInfo, content: {
            InfoView()
        })
        .fullScreenCover(isPresented: $viewModel.isShowingSettings , content: {
            SettingsView(settings: settings)
        })
        
        .sheet(isPresented: $viewModel.isShowingList) {
            ListView(
                filteredEvents: filteredEvents,
                onEventSelected: viewModel.selectEvent
            )
                .presentationDetents([.medium, .large])
        }

    }
}

#Preview {
    MainScreen()
}
