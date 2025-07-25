//
//  QuizHomeView.swift
//  Maven
//
//  Created by Isabella Sulisufi on 19/05/2025.
//

import SwiftUI

struct QuizHomeView: View {
    @ObservedObject var nav: NavigationViewModel

    let quizzes = QuizData.allQuizzes.sorted { $0.value.title < $1.value.title }

    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .center, spacing: 16) {
                    Text("Quizzes")
                        .font(.midTitle)
                        .multilineTextAlignment(.center)
                        .padding(.top, 20)

                    Text("🧠💰 Ready to test your financial knowledge?")
                        .font(.font16)

                    Text(
                        """
                        Take these engaging quizzes to learn key strategies and tips for improving your
                        financial health and boosting your MAVEN Score. Let’s see how much you know! 🚀✅
                        """
                    )
                    .font(.font16)

                    ForEach(quizzes, id: \.key) { quizID, quiz in
                        CardComponent(
                            title: quiz.category.uppercased(),
                            description: quiz.title,
                            icon: iconForCategory(quiz.category)
                        ) {
                            nav.navigateToQuizIntroView(quizID: quizID)
                        }
                    }
                }
                .padding()
            }
        }
    }

    func iconForCategory(_ category: String) -> String {
        switch category.lowercased() {
        case "credit":
            return "creditcard"
        case "borrowing money":
            return "banknote"
        case "accounts":
            return "building.columns"
        default:
            return "questionmark.circle"
        }
    }
}
