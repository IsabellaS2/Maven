//
//  HomeView.swift
//  Maven
//
//  Created by Isabella Sulisufi on 08/05/2025.
//

import SwiftUI

struct HomeView: View {

    @ObservedObject var homeVM: HomeViewModel
    @ObservedObject var nav: NavigationViewModel

    var levels: [MavenLevel] = [
        MavenLevel(name: "Explorer", range: 0...399),
        MavenLevel(name: "Builder", range: 400...649),
        MavenLevel(name: "Strategist", range: 650...849),
        MavenLevel(name: "Champion", range: 850...1000)
    ]

    var currentLevel: MavenLevel {
        levels.first { $0.range.contains(homeVM.totalScore) } ?? levels[0]
    }

    var progress: CGFloat {
        let lower = CGFloat(currentLevel.range.lowerBound)
        let upper = CGFloat(currentLevel.range.upperBound)
        return CGFloat(homeVM.totalScore - Int(lower)) / (upper - lower)
    }

    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()

            VStack {
                Text("MAVEN Score")
                    .font(Font.mavenTitle)
                    .padding(.bottom, 6.0)

                Button(
                    action: {
                        nav.navigateToInfoView()
                    },
                    label: {
                        Text("What is a MAVEN score?")
                            .font(.headline)
                            .underline(true, pattern: .solid)
                    }
                )
                .buttonStyle(PlainButtonStyle())

                Text("\(homeVM.totalScore)")
                    .font(.system(size: 64, weight: .heavy))

                Text("Level: \(currentLevel.name)")
                    .padding(.bottom, 20.0)

                ZStack(alignment: .leading) {
                    Rectangle()
                        .frame(height: 32)
                        .foregroundColor(.clear)
                        .overlay(
                            Rectangle()
                                .stroke(Color.black, lineWidth: 1)
                        )
                        .background(Color.gray.opacity(0.2))

                    Rectangle()
                        .frame(width: progressBarWidth, height: 32)
                        .foregroundColor(Color("progressBar"))
                }
                .padding(.horizontal)

                HStack {
                    Text("\(currentLevel.range.lowerBound)")
                    Spacer()
                    Text("\(currentLevel.range.upperBound)")
                }
                .padding(.horizontal)
                .padding(.bottom, 20.0)

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

                VStack(alignment: .leading) {
                    Text("🚀 Boost Your Score!")
                        .font(Font.font16)

                    HStack(spacing: 4) {
                        Button(
                            action: {
                                nav.navigateToFinancialCenter()
                            },
                            label: {
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
                                .frame(width: 175)
                            }
                        )
                        .buttonStyle(PlainButtonStyle())

                        Button(
                            action: {
                                nav.navigateToFinancialHabits()
                            },
                            label: {
                                VStack(alignment: .leading) {
                                    Text("📊 Your Financial Habits")
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
                                .frame(width: 180)
                            }
                        )
                        .buttonStyle(PlainButtonStyle())
                    }
                    .frame(height: 200.0)
                }
                .padding(.horizontal, 4.0)

                Spacer()
            }
            .padding()
        }
    }

    private var progressBarWidth: CGFloat {
        let screenWidth = UIScreen.main.bounds.width - 40
        return screenWidth * progress
    }
}
