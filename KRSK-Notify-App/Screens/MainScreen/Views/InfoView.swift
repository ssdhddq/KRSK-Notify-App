//
//  InfoView.swift
//  KRSK-Notify-App
//
//  Created by SSDHDDQ on 21.03.2025.
//

import SwiftUI

struct InfoView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    
                    Text("ℹ️ О приложении")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("Notify KRSK — это сервис для жителей Красноярска, который позволяет оперативно получать информацию о коммунальных отключениях: вода, свет, отопление и аварии.")
                    
                    Text("Цель проекта")
                        .font(.headline)
                    Text("Снизить стресс и неопределенность среди жителей города, обеспечить прозрачность работы коммунальных служб и повысить доверие к управляющим компаниям.")
                    
                    Text("Данные собираются:")
                        .font(.headline)
                    Text("""
• Сайты УК  
• Соцсети  
• Вручную через админ-панель
""")
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Информация")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Закрыть") {
                        dismiss()
                    }
                }
            }
        }
    }
}
