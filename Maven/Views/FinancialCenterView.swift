//
//  FinancialViewCenter.swift
//  Maven
//
//  Created by Isabella Sulisufi on 14/05/2025.
//

// fix swiftlint issues
// fix background not covering whole area

import SwiftUI

struct FinancialCenterView: View {
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
                            .padding(.bottom, 6.0)

                        Text("""
                        It won’t boost your score instantly, but better decisions start here. And keep an eye out, \
                        you might earn points for learning! 💡🔥
                        """)
                            .font(.font16)

                    }

                    // Improve Section
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Improve Videos")
                            .font(.font18Subtitle)

                        Text("Quick, insightful lessons to help you master your money.")
                            .font(.system(size: 16, weight: .light))

                        HStack {
                            CardComponent(
                                title: "CREDIT CARDS",
                                description: "What is a Credit Card?",
                                icon: "creditcard",
                                header: "QUIZ")

                            Spacer()
                            CardComponent(
                                title: "REPORT AND SCORE",
                                description: "What is a good and bad credit score?",
                                icon: "creditcard",
                                header: "QUIZ"
                            )
                        }
                    }
                    .padding(.bottom, 10.0)

                    // User Scenarios
                    VStack(alignment: .leading, spacing: 8) {
                        Text("User Scenarios")
                            .font(.font18Subtitle)

                        Text("Learn by doing with real-world financial scenarios.")
                            .font(.system(size: 16, weight: .light))

                        CardComponent(
                            title: "BUY NOW, PAY LATER",
                            description: "Sarah’s Credit Card Balance Transfer Misstep",
                            icon: "creditcard",
                            header: "User Scenario",
                            tag: "What went wrong?"
                        )

                        HStack {
                            CardComponent(        title: "CREDIT CARDS",
                                                  description: "Ellie’s Credit Card Struggles",
                                                  icon: "creditcard",
                                                  header: "User Scenario",
                                                  tag: "What went wrong?"
                            )
                            Spacer()
                            CardComponent(        title: "BUY NOW, PAY LATER",
                                                  description: "Maria’s BNPL Trouble",
                                                  icon: "creditcard",
                                                  header: "User Scenario",
                                                  tag: "What went wrong?"

                            )
                        }
                    }
                    .padding(.bottom, 12.0)

                    // Quizzes
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Quizzes")
                            .font(.font18Subtitle)

                        Text("Test your financial knowledge and see how much you really know!")
                            .font(.system(size: 16, weight: .light))

                        HStack {
                            CardComponent(        title: "CREDIT CARDS",
                                                  description: "Test your knowledge",
                                                  icon: "creditcard",
                                                  header: "QUIZ")
                            Spacer()
                            CardComponent(        title: "LOANS",
                                                  description: "Test your knowledge",
                                                  icon: "creditcard",
                                                  header: "QUIZ")
                        }
                    }
                    .padding(.bottom, 10.0)

                }
                .padding(.horizontal, 15.0)
            }
        }
    }
}

#Preview {
    FinancialCenterView()
}

#Preview {
    FinancialCenterView()
}
