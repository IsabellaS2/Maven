//
//  FinancialHabitsView.swift
//  Maven
//
//  Created by Isabella Sulisufi on 02/06/2025.
//

import SwiftUI

struct FinancialHabitsView: View {
    @ObservedObject var nav: NavigationViewModel

    let habitsData: FinancialHabitsData?
    let behaviour: Behaviour
    let viewModel: FinancialHabitsViewModel

    init(
        behaviour: Behaviour,
        nav: NavigationViewModel,
        viewModel: FinancialHabitsViewModel = FinancialHabitsViewModel()
    ) {
        self.behaviour = behaviour
        self.habitsData = loadJSON(fileName: "financialHabits", as: FinancialHabitsData.self)
        self._nav = ObservedObject(wrappedValue: nav)
        self.viewModel = viewModel
    }

    var body: some View {
        ZStack {
            Color("background").ignoresSafeArea()

            ScrollView {
                VStack(spacing: 24) {
                    Text("📊 Your Financial Habits & Score Impact")
                        .font(.midTitle)
                        .multilineTextAlignment(.center)
                        .padding(.top, 20)

                    VStack(alignment: .leading) {
                        Text(
                            "🔍 A personalised look at your financial habits - see what you're doing well and "
                            + "where you can improve! 💰✨"
                        )
                        .font(.font16)
                        .padding(.bottom, 6.0)

                        if let habits = habitsData {
                            let visibleGoodHabits = viewModel.buildVisibleGoodHabits(
                                from: habits,
                                with: behaviour
                            )
                            let visibleImprovements = viewModel.buildVisibleImprovements(
                                from: habits,
                                with: behaviour
                            )

                            // MARK: - Good Habits
                            Text("✅ What’s Going Well")
                                .font(.font24Subtitle)

                            if visibleGoodHabits.isEmpty {
                                LongCardComponent(
                                    title: "Nothing just yet...",
                                    description: """
                                    Why not explore a video or quiz to start building better \
                                    financial habits? 🎓
                                    """,
                                    icon: "",
                                    header: "📚 Let’s Get Learning!",
                                    navigation: {
                                        nav.navigateToFinancialCenter()
                                    }
                                )
                            } else {
                                ForEach(visibleGoodHabits, id: \.title) { card in
                                    LongCardComponent(
                                        title: card.description1,
                                        description: card.description2,
                                        icon: "",
                                        header: card.title
                                    )
                                }
                            }

                            // MARK: - Needs Improvement
                            Text("⚠️ What Needs Improvement")
                                .font(.font24Subtitle)
                                .padding(.top)

                            if visibleImprovements.isEmpty {
                                LongCardComponent(
                                    title: "You're in great shape! 🎉",
                                    description: "Keep doing what you’re doing — your financial habits are on point.",
                                    icon: "",
                                    header: "💪 No Improvements Needed",
                                    navigation: {
                                        nav.navigateToFinancialCenter()
                                    }
                                )
                            } else {

                                ForEach(visibleImprovements, id: \.title) { card in
                                    LongCardComponent(
                                        title: card.description1,
                                        description: card.description2,
                                        icon: "",
                                        header: card.title
                                    )
                                }
                            }
                        } else {
                            Text("Failed to load financial habits data.")
                                .foregroundColor(.red)
                        }
                    }
                }
                .padding(.horizontal, 15.0)
            }
        }
    }
}
