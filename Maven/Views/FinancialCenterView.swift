//
//  FinancialViewCenter.swift
//  Maven
//
//  Created by Isabella Sulisufi on 14/05/2025.
//

import SwiftUI

struct FinancialCenterView: View {
    @ObservedObject var nav: NavigationViewModel

    let quizzes = Array(
        QuizData.allQuizzes
            .sorted { $0.value.title < $1.value.title }
            .prefix(2)
    )

    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 24) {
                    Text("MAVEN Financial Center")
                        .font(.midTitle)
                        .multilineTextAlignment(.center)
                        .padding(.top, 20)

                    VStack(alignment: .leading) {
                        Text("""
                        Level up your financial skills! 🚀 Watch videos, take quizzes, and explore real-world \
                        scenarios to make smarter money moves.
                        """)
                        .font(.font16)
                        .padding(.bottom, 6)

                        Text("""
                        It won’t boost your score instantly, but better decisions start here. And keep an eye out, \
                        you might earn points for learning! 💡🔥
                        """)
                        .font(.font16)
                    }

                    // Quizzes
                    VStack(alignment: .leading, spacing: 8) {
                        Button {
                            nav.navigateToQuizHomeView()
                        } label: {
                            HStack {
                                Image(systemName: "house.fill")
                                    .frame(width: 32, height: 32)

                                VStack(alignment: .leading) {
                                    Text("Quizzes")
                                        .font(.font18Subtitle)

                                    Text("Test your financial knowledge and see how much you really know!")
                                        .font(.system(size: 16, weight: .light))
                                }
                            }
                        }
                        .buttonStyle(PlainButtonStyle())

                        HStack {
                            ForEach(quizzes, id: \.key) { quizID, quiz in
                                CardComponent(
                                    title: quiz.category.uppercased(),
                                    description: quiz.title,
                                    icon: ""
                                ) {
                                    nav.navigateToQuizIntroView(quizID: quizID)
                                }
                            }
                        }
                    }
                    .padding(.bottom, 10)

                    // User Scenarios
                    VStack(alignment: .leading, spacing: 8) {
                        Button {
                            nav.navigateToUserScenarioHomeView()
                        } label: {
                            HStack {
                                Image(systemName: "house.fill")
                                    .frame(width: 32, height: 32)

                                VStack(alignment: .leading) {
                                    Text("User Scenarios")
                                        .font(.font18Subtitle)

                                    Text("Learn by doing with real-world financial scenarios.")
                                        .font(.system(size: 16, weight: .light))
                                }
                            }
                        }
                        .buttonStyle(PlainButtonStyle())

                        CardComponent(
                            title: "BUY NOW, PAY LATER",
                            description: "Sarah’s Credit Card Balance Transfer Misstep",
                            icon: "creditcard",
                            header: "User Scenario",
                            tag: "What went wrong?",
                            navigation: {
                                nav.navigateToSarahView()
                            }
                        )

                        HStack {
                            CardComponent(
                                title: "CREDIT CARDS",
                                description: "Ellie’s Credit Card Struggles",
                                icon: "creditcard",
                                header: "User Scenario",
                                tag: "What went wrong?",
                                navigation: {
                                    nav.navigateToEllieView()
                                }
                            )
                            Spacer()
                            CardComponent(
                                title: "BUY NOW, PAY LATER",
                                description: "Maria’s BNPL Trouble",
                                icon: "creditcard",
                                header: "User Scenario",
                                tag: "What went wrong?",
                                navigation: {
                                    nav.navigateToMariaView()
                                }
                            )
                        }
                    }
                    .padding(.bottom, 12)

                    // Improve Section
                    VStack(alignment: .leading, spacing: 8) {
                        Button {
                            nav.navigateToImproveHomeView()
                        } label: {
                            HStack {
                                Image(systemName: "house.fill")
                                    .frame(width: 32, height: 32)

                                VStack(alignment: .leading) {
                                    Text("Improve Videos")
                                        .font(.font18Subtitle)

                                    Text("Quick, insightful lessons to help you master your money.")
                                        .font(.system(size: 16, weight: .light))
                                }
                            }
                        }
                        .buttonStyle(PlainButtonStyle())

                        HStack {
                            CardComponent(
                                title: "CREDIT CARDS",
                                description: "What is a Credit Card?",
                                icon: "creditcard",
                                header: "Improve"
                            )
                            Spacer()
                            CardComponent(
                                title: "REPORT AND SCORE",
                                description: "What is a good and bad credit score?",
                                icon: "creditcard",
                                header: "Improve"
                            )
                        }
                    }
                    .padding(.bottom, 10)
                }
                .padding(.horizontal, 15)
            }
        }
    }
}
