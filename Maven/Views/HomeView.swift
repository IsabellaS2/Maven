//
//  HomeView.swift
//  Maven
//
//  Created by Isabella Sulisufi on 08/05/2025.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()

            VStack {
                Text("MAVEN Score")
                    .font(Font.mavenTitle)
                    .padding(.bottom, 6.0)

                Text("What is a MAVEN Score?")
                    .font(Font.font16)
                    .underline(true, pattern: .solid)

                Text("450")
                    .font(.system(size: 64, weight: .heavy))
                Text("Level: Builder")
                    .padding(.bottom, 20.0)

                // Latest Updates
                VStack(alignment: .leading) {
                    Text("📢 Latest Updates")

                    HStack {
                        VStack(alignment: .leading) {
                            Text("Credit card utilisation has improved this month")
                                .font(.headline)
                                .padding(.bottom, 5)
                            Text("Your score might go up soon! ")
                        }
                    }
                    .padding(15.0)
                    .background(Color.white)
                    .cornerRadius(10)
                    Spacer()
                }

                // Boost your score
                VStack(alignment: .leading) {
                    Text("🚀 Boost Your Score!")
                        .font(Font.font16)
                    // Cards - Financial Knowledge Centre and Financial Habits
                    HStack(spacing: 4) {
                        VStack(alignment: .leading) {
                            Text("📚 Financial Knowledge Center")
                                .font(Font.font16)
                                .padding(.bottom, 2.0)

                            Text("Learn, grow, and master your money")
                                .font(Font.font16Light)

                            Spacer()
                            Text("🎥 Videos\n🧩 Quizzes\n👥 User Scenarios")
                                .font(Font.font16Light)

                        }
                        .padding(10.0)
                        .background(Color.white)
                        .cornerRadius(10)
                        .frame(maxWidth: .infinity)

                        VStack(alignment: .leading) {
                            Text("📊 Your Financial Habits ")
                                .font(Font.font16)
                                .padding(.bottom, 2.0)

                            Text("See how your behaviour shapes your score!")
                                .font(Font.font16Light)

                            Spacer()
                            Text("📊 Credit Card Usage\n💳 Transactions\n🛒 BNPL Usage")
                                .font(Font.font16Light)

                        }
                        .padding(10.0)
                        .background(Color.white)
                        .cornerRadius(10)
                        .frame(maxWidth: .infinity)
                    }
                    .frame(height: 200.0)
                }
                .padding(.horizontal, 4.0)
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    HomeView()
}
