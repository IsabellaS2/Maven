//
//  FinancialHabitsCardCalc.swift
//  Maven
//
//  Created by Isabella Sulisufi on 18/07/2025.
//

// MARK: - What's Going Well

func shouldShowOnTimeLoanPayments(_ loans: [Loan]?) -> Bool {
    guard let loans = loans, !loans.isEmpty else { return false }
    return loans.allSatisfy { $0.repaymentConsistency == "always_consistent" }
}

func shouldShowHealthySavings(_ savings: [SavingsAccount]?) -> Bool {
    guard let savings = savings, !savings.isEmpty else { return false }
    return savings.allSatisfy { $0.balance.current > 300 }
}

func shouldShowStableIncome(_ income: Income?) -> Bool {
    guard let income = income else { return false }
    return income.isStable == true
}

func shouldShowSmartBNPL(_ providers: [BNPLUsageProvider]?) -> Bool {
    guard let providers = providers, !providers.isEmpty else { return false }
    let totalTransactions = providers.reduce(0) { $0 + $1.transactionsLast30Days }
    return totalTransactions <= 1
}

func shouldShowNoLatePayments(_ paymentHistory: PaymentHistory?) -> Bool {
    guard let missed = paymentHistory?.missedPaymentsLast6Months else { return false }
    return missed == 0
}

func shouldShowLowDTI(_ ratio: Double?) -> Bool {
    guard let ratio = ratio else { return false }
    return ratio <= 0.3
}

// MARK: - What Needs Improvement

func shouldShowMissedCreditCardPayments(_ paymentHistory: PaymentHistory?) -> Bool {
    guard let missed = paymentHistory?.missedPaymentsLast6Months else { return false }
    return missed > 0
}

func shouldShowHighBNPLUsage(_ providers: [BNPLUsageProvider]?) -> Bool {
    guard let providers = providers, !providers.isEmpty else { return false }
    let totalTransactions = providers.reduce(0) { $0 + $1.transactionsLast30Days }
    return totalTransactions >= 3
}

func shouldShowLowSavings(_ savings: [SavingsAccount]?) -> Bool {
    guard let savings = savings, !savings.isEmpty else { return false }
    return savings.contains { $0.balance.current < 200 }
}

func shouldShowOverLimitSpending(_ cards: [CreditCard]?) -> Bool {
    guard let cards = cards, !cards.isEmpty else { return false }
    return cards.contains { $0.utilisation > 1.0 }
}

func shouldShowMissedLoanPayments(_ loans: [Loan]?) -> Bool {
    guard let loans = loans, !loans.isEmpty else { return false }
    return loans.contains { $0.repaymentConsistency != "always_consistent" }
}

func shouldShowHighDTI(_ ratio: Double?) -> Bool {
    guard let ratio = ratio else { return false }
    return ratio > 0.31
}
