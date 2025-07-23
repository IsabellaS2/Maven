//
//  QuizResultView.swift
//  Maven
//
//  Created by Isabella Sulisufi on 21/07/2025.
//

import SwiftUI

struct QuizResultView: View {
    @ObservedObject var nav: NavigationViewModel
    let score: Int
    let total: Int

    var body: some View {
        
        
        VStack(spacing: 20) {
            if score == total {
                Text("🎉 Perfect Score!")
                    .font(.title)
            } else if Double(score) / Double(total) >= 0.6 {
                Text("✅ Nice job!")
                    .font(.title)
            } else {
                Text("🙁 Keep trying!")
                    .font(.title)
            }

            Text("You scored \(score) out of \(total)")
                .font(.body)
            
            Button {
                nav.navigateToQuizHomeView()
            } label: {
                Text("go home")
            }
        }
        .padding()
    }
}
