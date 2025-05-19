//
//  UserScenarioHomeView.swift
//  Maven
//
//  Created by Isabella Sulisufi on 16/05/2025.
//

import SwiftUI

struct UserScenarioHomeView: View {
    var body: some View {

        ZStack {
            Color("background")
                .ignoresSafeArea()

            ScrollView {
                Text("User Scenarios")
                    .font(.midTitle)
                    .multilineTextAlignment(.center)
                    .padding(.top, 20)
                VStack(alignment: .leading) {
                    Text("🚶‍♂️💡 Walk through real-world financial scenarios to understand the consequences of your choices. ")
                        .font(.font16)
                        .padding(.bottom, 6.0)

                    Text("""
                        Learn what went wrong, how to fix it, and what you could have done differently \
                        to improve your financial decisions.
                        """)
                        .font(.font16)
                        .padding(.bottom, 12.0)

                    // Credit Cards
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Credit Cards")
                            .font(.font18Subtitle)

                        LongCardComponent(
                            title: "CREDIT CARDS",
                            description: "Sarah’s Credit Card Balance Transfer Misstep",
                            icon: "creditcard",
                            header: "User Scenario",
                            tag: "What went wrong?"
                        )

                        LongCardComponent(
                            title: "CREDIT CARDS",
                            description: "Ellie’s Credit Card Struggles",
                            icon: "creditcard",
                            header: "User Scenario",
                            tag: "What went wrong?"
                        )
                    }
                    .padding(.bottom, 10.0)

                    // BNPL
                    VStack(alignment: .leading, spacing: 8) {
                        Text("BNPL")
                            .font(.font18Subtitle)

                        HStack {
                            LongCardComponent(
                                title: "BUY NOW, PAY LATER",
                                description: "Maria’s BNPL Trouble",
                                icon: "cart.badge.plus",
                                header: "User Scenario",
                                tag: "What went wrong?"
                            )
                        }
                    }
                    .padding(.bottom, 10.0)

                    // Mortgages
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Mortgages")
                            .font(.font18Subtitle)

                        LongCardComponent(
                            title: "MORTGAGES",
                            description: "Marcus’s Mortgage Misunderstanding",
                            icon: "house.fill",
                            header: "User Scenario",
                            tag: "What went wrong?"
                        )
                    }
                    .padding(.bottom, 10.0)

                    // Loans
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Loans")
                            .font(.font18Subtitle)

                        LongCardComponent(
                            title: "LOANS",
                            description: "Jake’s Debt Dilemma",
                            icon: "banknote",
                            header: "User Scenario",
                            tag: "What went wrong?"
                        )
                        LongCardComponent(
                            title: "LOANS",
                            description: "Omar’s Car Loan Oversight",
                            icon: "banknote",
                            header: "User Scenario",
                            tag: "What went wrong?"
                        )
                    }
                    .padding(.bottom, 10.0)

                }
                .padding()
            }
        }
    }
}

#Preview {
    UserScenarioHomeView()
}
