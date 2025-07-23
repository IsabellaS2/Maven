//
//  QuizHomeView.swift
//  Maven
//
//  Created by Isabella Sulisufi on 19/05/2025.
//

import SwiftUI

struct QuizHomeView: View {
    var body: some View {

        ZStack {
            Color("background")
                .ignoresSafeArea()

            ScrollView {
                Text("Quizzes")
                    .font(.midTitle)
                    .multilineTextAlignment(.center)
                    .padding(.top, 20)
                VStack(alignment: .leading) {
                    Text("🧠💰 Ready to test your financial knowledge?")
                        .font(.font16)
                        .padding(.bottom, 6.0)

                    Text("""
                        Take these engaging quizzes to learn key strategies and tips for improving your financial health and boosting your MAVEN Score. Let’s see how much you know! 🚀✅
                        """)
                        .font(.font16)
                        .padding(.bottom, 12.0)

                    // Credit
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Credit")
                            .font(.font18Subtitle)

                        LongCardComponent(
                            title: "CREDIT CARDS",
                            description: "Credit Cards - Basics & Best Practices",
                            icon: "creditcard"
                        )

                        HStack {
                            CardComponent(
                                title: "CREDIT CARDS",
                                description: "Understanding APR, Interest & Charges",
                                icon: "dollarsign.circle"
                            )
                            LongCardComponent(
                                title: "CREDIT CARDS",
                                description: "Credit Scores & Reports",
                                icon: "shield.checkerboard"
                            )
                        }
                    }
                    .padding(.bottom, 15.0)

                    // Borrowing Money
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Borrowing Money")
                            .font(.font18Subtitle)

                        HStack {
                            LongCardComponent(
                                title: "BNPL",
                                description: "Buy Now, Pay Later",
                                icon: "cart.badge.plus"
                            )
                            Spacer()
                            LongCardComponent(
                                title: "MORTGAGES",
                                description: "Mortgage Basics",
                                icon: "house.fill"
                            )
                        }
                        HStack {
                            LongCardComponent(
                                title: "LOANS",
                                description: "Understanding Personal Loans",
                                icon: "banknote"
                            )
                            LongCardComponent(
                                title: "CREDIT CARDS",
                                description: "Balance Transfers Explained",
                                icon: "dollarsign.arrow.circlepath"
                            )
                        }
                    }
                    .padding(.bottom, 10.0)

                    // Accounts
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Accounts")
                            .font(.font18Subtitle)

                        LongCardComponent(
                            title: "MORTGAGES",
                            description: "Bank Accounts & Savings (UK)",
                            icon: "building.columns"
                        )
                    }
                    .padding(.bottom, 10.0)
                }
                .padding()
            }
        }
    }
}
