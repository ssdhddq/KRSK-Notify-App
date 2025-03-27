//
//  ButtonsInMainView.swift
//  KRSK-Notify-App
//
//  Created by SSDHDDQ on 21.03.2025.
//

import SwiftUI

struct ButtonsInMainView: View {
    let imageName: String
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }) {
            Image(systemName: imageName)
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(.white)
                .font(.title2)
                .padding(10)
                .background(.black)
                .clipShape(Circle())
                .shadow(radius: 1)
        }
    }
}
