//
//  SwiftUIView.swift
//  Maven
//
//  Created by Isabella Sulisufi on 22/07/2025.
//

import SwiftUI

struct SwiftUIView: View {
    let score: Int
    let total: Int

    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            VStack(spacing: 20) {
                Spacer()
                if score == total {
                    Text("🎉 Perfect Score!")
                        .font(.midTitle)
                    
                    
                } else if Double(score) / Double(total) >= 0.6 {
                    Text("✅ Nice job!")
                        .font(.midTitle)
                } else {
                    Text("🙁 Keep trying!")
                        .font(.midTitle)
                    
                    Text ("It’s okay - you didn’t pass this time, but don’t worry, you’re one step closer to mastering financial knowledge! ")
                }
                
                Text("You scored \(score) out of \(total)")
                    .font(.font16)
                
                Spacer()
                
                CustomButton(
                    text: "Check out more like this",
                    color: .white,
                    width: 40,
                    navigation: {
//                        nav.navigateToQuizHomeView()
                    }
                )
                
                Spacer()
            }
            .padding()
        }
    }
}



#Preview {
    SwiftUIView(score: 3, total: 5)
}
