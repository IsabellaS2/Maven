//
//  QuizIntroView.swift
//  Maven
//
//  Created by Isabella Sulisufi on 21/07/2025.
//

import SwiftUI

struct QuizIntroView: View {
    @ObservedObject var nav: NavigationViewModel
    let quizID: String
    let quiz: QuizSet

    init(quizID: String, nav: NavigationViewModel) {
        self.quizID = quizID
        self.nav = nav
        self.quiz = QuizData.allQuizzes[quizID]!
    }

    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()

            VStack {
                VStack(spacing: 20) {
                    Text(quiz.title)
                        .font(.midTitle)
                        .multilineTextAlignment(.center)
                        .padding(.top, 20)

                    Text("Category: \(quiz.category)")
                        .font(.font18Subtitle)

                    Text("Ready to test your knowledge?")
                        .font(.font16)

                    Spacer()

                    CustomButton(
                        text: "Continue",
                        color: .white,
                        width: 80,
                        navigation: {
                            nav.navigateToQuizQuestionView(quizID: quizID)
                        }
                    )

                    CustomButton(
                        text: "Go Back",
                        color: .gray,
                        width: 60,
                        navigation: {
                            nav.navigateToQuizHomeView()
                        }
                    )

                    Spacer()
                }
                .padding()
            }
        }
    }
}
