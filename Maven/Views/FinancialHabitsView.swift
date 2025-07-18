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
    
    init(behaviour: Behaviour, nav: NavigationViewModel) {
        self.behaviour = behaviour
        self.habitsData = loadFinancialHabits()
        self._nav = ObservedObject(wrappedValue: nav)
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
                        Text("🔍 A personalised look at your financial habits - see what you're doing well and where you can improve! 💰✨")
                            .font(.font16)
                            .padding(.bottom, 6.0)

                        if let habits = habitsData {

                            // MARK: - Good Habits
                            let visibleGoodHabits: [(String, String, String)] = [
                                (
                                    habits.whats_going_well.on_time_loan_payments.title,
                                    habits.whats_going_well.on_time_loan_payments.description_1,
                                    habits.whats_going_well.on_time_loan_payments.description_2
                                )
                            ].filter { _ in shouldShowOnTimeLoanPayments(behaviour.loans) } +
                            [
                                (
                                    habits.whats_going_well.healthy_savings.title,
                                    habits.whats_going_well.healthy_savings.description_1,
                                    habits.whats_going_well.healthy_savings.description_2
                                )
                            ].filter { _ in shouldShowHealthySavings(behaviour.accounts?.savingsAccounts) } +
                            [
                                (
                                    habits.whats_going_well.stable_income.title,
                                    habits.whats_going_well.stable_income.description_1,
                                    habits.whats_going_well.stable_income.description_2
                                )
                            ].filter { _ in shouldShowStableIncome(behaviour.income) } +
                            [
                                (
                                    habits.whats_going_well.smart_bnpl_management.title,
                                    habits.whats_going_well.smart_bnpl_management.description_1,
                                    habits.whats_going_well.smart_bnpl_management.description_2
                                )
                            ].filter { _ in shouldShowSmartBNPL(behaviour.bnpl?.providers) } +
                            [
                                (
                                    habits.whats_going_well.no_late_payments.title,
                                    habits.whats_going_well.no_late_payments.description_1,
                                    habits.whats_going_well.no_late_payments.description_2
                                )
                            ].filter { _ in shouldShowNoLatePayments(behaviour.paymentHistory) } +
                            [
                                (
                                    habits.whats_going_well.low_debt_to_income.title,
                                    habits.whats_going_well.low_debt_to_income.description_1,
                                    habits.whats_going_well.low_debt_to_income.description_2
                                )
                            ].filter { _ in shouldShowLowDTI(behaviour.debtToIncomeRatio) }

                            Text("✅ What’s Going Well")
                                .font(.font24Subtitle)

                            if visibleGoodHabits.isEmpty {
                                LongCardComponent(
                                    title: "Nothing just yet...",
                                    description: "Why not explore a video or quiz to start building better financial habits? 🎓",
                                    icon: "",
                                    header: "📚 Let’s Get Learning!",
                                    navigation: {
                                        nav.navigateToFinancialCenter()
                                    }
                                )
                            } else {
                                ForEach(visibleGoodHabits.indices, id: \.self) { index in
                                    let card = visibleGoodHabits[index]
                                    LongCardComponent(
                                        title: card.1,
                                        description: card.2,
                                        icon: "",
                                        header: card.0
                                    )
                                }
                            }

                            // MARK: - Improvements
                            let visibleImprovements: [(String, String, String)] = [
                                (
                                    habits.what_needs_improvement.missed_credit_cards.title,
                                    habits.what_needs_improvement.missed_credit_cards.description_1,
                                    habits.what_needs_improvement.missed_credit_cards.description_2
                                )
                            ].filter { _ in shouldShowMissedCreditCardPayments(behaviour.paymentHistory) } +
                            [
                                (
                                    habits.what_needs_improvement.high_bnpl_usage.title,
                                    habits.what_needs_improvement.high_bnpl_usage.description_1,
                                    habits.what_needs_improvement.high_bnpl_usage.description_2
                                )
                            ].filter { _ in shouldShowHighBNPLUsage(behaviour.bnpl?.providers) } +
                            [
                                (
                                    habits.what_needs_improvement.low_savings.title,
                                    habits.what_needs_improvement.low_savings.description_1,
                                    habits.what_needs_improvement.low_savings.description_2
                                )
                            ].filter { _ in shouldShowLowSavings(behaviour.accounts?.savingsAccounts) } +
                            [
                                (
                                    habits.what_needs_improvement.over_limit_spending.title,
                                    habits.what_needs_improvement.over_limit_spending.description_1,
                                    habits.what_needs_improvement.over_limit_spending.description_2
                                )
                            ].filter { _ in shouldShowOverLimitSpending(behaviour.creditCards) } +
                            [
                                (
                                    habits.what_needs_improvement.missed_loan_payments.title,
                                    habits.what_needs_improvement.missed_loan_payments.description_1,
                                    habits.what_needs_improvement.missed_loan_payments.description_2
                                )
                            ].filter { _ in shouldShowMissedLoanPayments(behaviour.loans) } +
                            [
                                (
                                    habits.what_needs_improvement.high_debt_to_income.title,
                                    habits.what_needs_improvement.high_debt_to_income.description_1,
                                    habits.what_needs_improvement.high_debt_to_income.description_2
                                )
                            ].filter { _ in shouldShowHighDTI(behaviour.debtToIncomeRatio) }

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
                                ForEach(visibleImprovements.indices, id: \.self) { index in
                                    let card = visibleImprovements[index]
                                    LongCardComponent(
                                        title: card.1,
                                        description: card.2,
                                        icon: "",
                                        header: card.0
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
