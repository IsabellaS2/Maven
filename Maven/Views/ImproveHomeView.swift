//
//  ImproveHomeView.swift
//  Maven
//
//  Created by Isabella Sulisufi on 19/05/2025.
//

import SwiftUI

struct ImproveHomeView: View {
    var body: some View {

        ZStack {
            Color("background")
                .ignoresSafeArea()

            ScrollView {
                Text("Improve Videos")
                    .font(.midTitle)
                    .multilineTextAlignment(.center)
                    .padding(.top, 20)
                VStack(alignment: .leading) {
                    Text("🎥📈 Watch educational videos designed to enhance your financial knowledge. ")
                        .font(.font16)
                        .padding(.bottom, 6.0)

                    Text("""
                        Learn key strategies and tips to improve your financial health and boost your MAVEN Score.
                        """)
                        .font(.font16)
                        .padding(.bottom, 18.0)

                    // Credit Cards
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Credit Cards")
                            .font(.font18Subtitle)

                        HStack {
                            CardComponent(
                                title: "CREDIT CARDS",
                                description: "What is a purchase credit card?",
                                icon: "cart"
                            )
                            LongCardComponent(
                                title: "CREDIT CARDS",
                                description: "What is a credit balance?",
                                icon: "scalemass"
                            )
                        }
                    }
                    .padding(.bottom, 15.0)

                    // Loans
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Loans")
                            .font(.font18Subtitle)

                        HStack {
                            LongCardComponent(
                                title: "BNPL",
                                description: "The biggest loan myths",
                                icon: "questionmark.circle"
                            )
                            Spacer()
                            LongCardComponent(
                                title: "MORTGAGES",
                                description: "How to reduce your debt",
                                icon: "chart.line.downtrend.xyaxis"
                            )
                        }
                        HStack {
                            LongCardComponent(
                                title: "LOANS",
                                description: "What is a secured loan",
                                icon: "lock"
                            )
                            LongCardComponent(
                                title: "LOANS",
                                description: "What is an unsecured loan?",
                                icon: "lock.open"
                            )
                        }
                    }
                    .padding(.bottom, 10.0)

                    // Accounts
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Car Finance")
                            .font(.font18Subtitle)

                        LongCardComponent(
                            title: "CAR FINANCE",
                            description: "What is depreciation?",
                            icon: "arrow.down.right"
                        )
                        LongCardComponent(
                            title: "CAR FINANCE",
                            description: "What is balloon payment?",
                            icon: "balloon"
                        )
                    }
                    .padding(.bottom, 10.0)
                }
                .padding()
            }
        }
    }

}
