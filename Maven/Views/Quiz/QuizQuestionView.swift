//
//  QuizQuestionView.swift
//  Maven
//
//  Created by Isabella Sulisufi on 21/07/2025.
//

import Foundation
import SwiftUI

struct QuizQuestionView: View {
    @ObservedObject var nav: NavigationViewModel

    let quiz: QuizSet

    @State private var currentIndex = 0
    @State private var score = 0
    @State private var showResult = false
    @State private var showHintSheet = false
    @State private var hintsRemaining = 2

    var body: some View {
        if showResult {
            QuizResultView(nav: nav, score: score, total: quiz.questions.count)
        } else {
            let question = quiz.questions[currentIndex]
            
            
            ZStack {
                Color("background")
                    .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 20) {
                Text(question.question)
                    .font(.font18Subtitle)
                
                ForEach(question.options, id: \.self) { option in
                    Button(action: {
                        if option == question.correct_answer {
                            score += 1
                        }
                        if currentIndex + 1 < quiz.questions.count {
                            currentIndex += 1
                        } else {
                            showResult = true
                        }
                    }) {
                        Text(option)
                            .foregroundColor(Color.font)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(8)
                    }
                }
                
                if hintsRemaining > 0 {
                    Button("Need a hint? You have \(hintsRemaining) hint\(hintsRemaining == 1 ? "" : "s") remaining") {
                        showHintSheet = true
                        hintsRemaining -= 1
                    }
                    .padding(.top)
                    .foregroundColor(Color.font)

                } else {
                    Text("No hints remaining")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .padding(.top)
                }
            }
            .padding()
            .sheet(isPresented: $showHintSheet) {
                VStack(spacing: 10) {
                    Text("Hint")
                        .font(.headline)
                    Text(question.explanation)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Button("Got it!") {
                        showHintSheet = false
                    }
                    .padding()
                }
                .presentationDetents([.fraction(0.30)])
                .presentationDragIndicator(.visible)
            }
        }
        }
    }
}
