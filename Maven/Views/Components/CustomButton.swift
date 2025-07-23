//
//  CustomButton.swift
//  Maven
//
//  Created by Isabella Sulisufi on 22/07/2025.
//

import SwiftUI

struct CustomButton: View {
    
    let text: String
    let color: Color
    let width: CGFloat
    let navigation: () -> Void

    var body: some View {
        Button {
            navigation()
        } label: {
            HStack(alignment: .center, spacing: 0) {
                Text(text)
            }
            .padding(.horizontal, width)
            .padding(.vertical, 16)
            .frame(height: 45, alignment: .trailing)
            .background(color)
            .cornerRadius(15)
            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
        }
        

    }
}
