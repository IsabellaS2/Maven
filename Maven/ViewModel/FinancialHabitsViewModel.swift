//
//  FinancialHabitsViewModel.swift
//  Maven
//
//  Created by Isabella Sulisufi on 25/07/2025.
//

import Foundation

final class FinancialHabitsViewModel {
    func buildVisibleGoodHabits(
        from habits: FinancialHabitsData,
        with behaviour: Behaviour
    ) -> [HabitCard] {
        let good = habits.whatsGoingWell

        return [
            HabitCard(
                shouldShow: { _ in shouldShowOnTimeLoanPayments(behaviour.loans) },
                title: good.onTimeLoanPayments.title,
                description1: good.onTimeLoanPayments.description1,
                description2: good.onTimeLoanPayments.description2
            ),
            HabitCard(
                shouldShow: { _ in shouldShowHealthySavings(behaviour.accounts?.savingsAccounts) },
                title: good.healthySavings.title,
                description1: good.healthySavings.description1,
                description2: good.healthySavings.description2
            ),
            HabitCard(
                shouldShow: { _ in shouldShowStableIncome(behaviour.income) },
                title: good.stableIncome.title,
                description1: good.stableIncome.description1,
                description2: good.stableIncome.description2
            ),
            HabitCard(
                shouldShow: { _ in shouldShowSmartBNPL(behaviour.bnpl?.providers) },
                title: good.smartBnplManagement.title,
                description1: good.smartBnplManagement.description1,
                description2: good.smartBnplManagement.description2
            ),
            HabitCard(
                shouldShow: { _ in shouldShowNoLatePayments(behaviour.paymentHistory) },
                title: good.noLatePayments.title,
                description1: good.noLatePayments.description1,
                description2: good.noLatePayments.description2
            ),
            HabitCard(
                shouldShow: { _ in shouldShowLowDTI(behaviour.debtToIncomeRatio) },
                title: good.lowDebtToIncome.title,
                description1: good.lowDebtToIncome.description1,
                description2: good.lowDebtToIncome.description2
            )
        ]
        .filter { $0.shouldShow(behaviour) }
    }

    func buildVisibleImprovements(
        from habits: FinancialHabitsData,
        with behaviour: Behaviour
    ) -> [HabitCard] {
        let bad = habits.whatNeedsImprovement

        return [
            HabitCard(
                shouldShow: { _ in shouldShowMissedCreditCardPayments(behaviour.paymentHistory) },
                title: bad.missedCreditCards.title,
                description1: bad.missedCreditCards.description1,
                description2: bad.missedCreditCards.description2
            ),
            HabitCard(
                shouldShow: { _ in shouldShowHighBNPLUsage(behaviour.bnpl?.providers) },
                title: bad.highBnplUsage.title,
                description1: bad.highBnplUsage.description1,
                description2: bad.highBnplUsage.description2
            ),
            HabitCard(
                shouldShow: { _ in shouldShowLowSavings(behaviour.accounts?.savingsAccounts) },
                title: bad.lowSavings.title,
                description1: bad.lowSavings.description1,
                description2: bad.lowSavings.description2
            ),
            HabitCard(
                shouldShow: { _ in shouldShowOverLimitSpending(behaviour.creditCards) },
                title: bad.overLimitSpending.title,
                description1: bad.overLimitSpending.description1,
                description2: bad.overLimitSpending.description2
            ),
            HabitCard(
                shouldShow: { _ in shouldShowMissedLoanPayments(behaviour.loans) },
                title: bad.missedLoanPayments.title,
                description1: bad.missedLoanPayments.description1,
                description2: bad.missedLoanPayments.description2
            ),
            HabitCard(
                shouldShow: { _ in shouldShowHighDTI(behaviour.debtToIncomeRatio) },
                title: bad.highDebtToIncome.title,
                description1: bad.highDebtToIncome.description1,
                description2: bad.highDebtToIncome.description2
            )
        ]
        .filter { $0.shouldShow(behaviour) }
    }
}
