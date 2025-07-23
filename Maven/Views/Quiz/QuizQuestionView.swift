//
//  QuizQuestionView.swift
//  Maven
//
//  Created by Isabella Sulisufi on 21/07/2025.
//

import Foundation
import SwiftUI

struct QuizQuestionsView: View {
    @ObservedObject var nav: NavigationViewModel

    let quiz: QuizSet

    @State private var currentIndex = 0
    @State private var score = 0
    @State private var showResult = false

    var body: some View {
        if showResult {
            QuizResultView(nav: nav, score: score, total: quiz.questions.count)
        } else {
            let question = quiz.questions[currentIndex]

            VStack(alignment: .leading, spacing: 20) {
                Text(question.question)
                    .font(.headline)

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
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(8)
                    }
                }

                Text("Tip: \(question.explanation)")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .padding(.top)
            }
            .padding()
        }
    }
}
