//
//  MavenInfoView.swift
//  Maven
//
//  Created by Isabella Sulisufi on 08/05/2025.
//

import SwiftUI

struct MavenInfoView: View {
    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .center, spacing: 24) {

                    // Title Section
                    VStack(spacing: 8) {
                        Text("MAVEN")
                            .font(Font.mavenTitle)
                            .multilineTextAlignment(.center)

                        Text("(Maturity, Awareness, Value,\nEducation, Navigation)")
                            .font(.system(size: 20))
                            .multilineTextAlignment(.center)
                    }

                    // What is a MAVEN Score?
                    VStack(alignment: .center, spacing: 8) {
                        Text("What is a MAVEN score?")
                            .font(.headline)

                        Text(
                            """
                            A MAVEN score is a unique financial literacy and behaviour score that measures 
                            how well you understand and manage credit. Unlike a traditional credit score (which 
                            only looks at past borrowing history), this score reflects your financial
                            knowledge and behaviour.
                            """
                        )
                        .font(Font.font16)
                    }
                    .padding(.horizontal, 15.0)

                    // Icons
                    HStack(spacing: 40) {
                        Image(systemName: "books.vertical")
                            .font(.largeTitle)
                        Image(systemName: "creditcard")
                            .font(.largeTitle)
                    }

                    Text("How is your MAVEN Score calculated?")
                        .font(.headline)
                        .padding(.bottom, 8)

                    // Score Calculation Section
                    VStack(alignment: .center, spacing: 12) {

                        // Financial Knowledge
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Financial Knowledge")
                                .font(Font.font18Subtitle)

                            Text(
                                "This calculates your financial knowledge based on your interactions and results with "
                                + "products on ClearScore. This can include:"
                            )
                            .font(Font.font16)
                            .padding(.bottom, 6.0)

                            Text(
                                "1. Completing Quizzes\n"
                                + "2. Watching Improve Videos\n"
                                + "3. Completing User Scenarios"
                            )
                            .font(Font.font16)
                        }
                        .padding(.bottom, 12.0)

                        // Behaviour
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Behaviour")
                                .font(Font.font18Subtitle)

                            Text(
                                "This looks at your banking transactions and accounts and analyses"
                                + " a score based on many factors including:"
                            )
                            .font(Font.font16)
                            .padding(.bottom, 6.0)

                            Text(
                                "1. Types of payments\n"
                                + "2. Credit utilisation\n"
                                + "3. Savings accounts"
                            )
                            .font(Font.font16)
                        }
                    }
                    .padding(.horizontal, 30.0)

                    // Level Meaning Section
                    VStack(alignment: .leading, spacing: 8) {
                        Text("What does the level mean?")
                            .font(.headline)

                        Text(
                            "There are 4 types of levels you can have with a maturity level."
                            + "They are all based on the score you have."
                        )
                        .font(Font.font16)

                        VStack(alignment: .leading) {
                            Text("1. ").font(Font.font16)
                                + Text("Explorer").bold()
                                + Text(" (0–399)").font(Font.font16Light)

                            Text("2. ").font(Font.font16)
                                + Text("Builder").bold()
                                + Text(" (400–649)").font(Font.font16Light)

                            Text("3. ").font(Font.font16)
                                + Text("Strategist").bold()
                                + Text(" (650–849)").font(Font.font16Light)

                            Text("4. ").font(Font.font16)
                                + Text("Champion").bold()
                                + Text(" (850–1000)").font(Font.font16Light)
                        }

                        Text("As your score increases, you can bump up to the next level!")
                            .font(Font.font16)
                    }
                    .padding(.horizontal, 30.0)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
            }
        }
    }
}
