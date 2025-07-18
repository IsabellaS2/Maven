//
//  BehaviourModels.swift
//

import Foundation

// Behaviour and related financial info
struct Behaviour: Codable {
    var accounts: Accounts?
    var income: Income?
    var creditCards: [CreditCard]?
    var loans: [Loan]?
    var bnpl: BNPL?
    var transactions: [Transaction]?
    var categories: [String]?
    var debtToIncomeRatio: Double?
    var lastPaidDate: String?
    var paymentHistory: PaymentHistory?

    enum CodingKeys: String, CodingKey {
        case accounts, income, loans, bnpl, transactions, categories
        case creditCards = "credit_cards"
        case debtToIncomeRatio = "debt_to_income_ratio"
        case lastPaidDate = "last_paid_date"
        case paymentHistory = "payment_history"
    }
}

struct Income: Codable {
    var source: String
    var frequency: String
    var averageAmount: Double
    var lastPaidDate: String?
    var nextExpectedDate: String?
    var isStable: Bool?

    enum CodingKeys: String, CodingKey {
        case source, frequency
        case averageAmount = "average_amount"
        case lastPaidDate = "last_paid_date"
        case nextExpectedDate = "next_expected_date"
        case isStable = "is_stable"
    }
}

struct CreditCard: Codable {
    var provider: String
    var limit: Double
    var balance: Double
    var lastLimitIncrease: String?
    var lastLimitDecrease: String?

    enum CodingKeys: String, CodingKey {
        case provider, limit, balance
        case lastLimitIncrease = "last_limit_increase"
        case lastLimitDecrease = "last_limit_decrease"
    }
}

extension CreditCard {
    var utilisation: Double {
        guard limit > 0 else { return 0 }
        return balance / limit
    }
}

struct Loan: Codable {
    var provider: String
    var amount: Double?
    var balanceRemaining: Double?
    var monthlyRepayment: Double
    var repaymentConsistency: String

    enum CodingKeys: String, CodingKey {
        case provider, amount
        case balanceRemaining = "balance_remaining"
        case monthlyRepayment = "monthly_repayment"
        case repaymentConsistency = "repayment_consistency"
    }
}

struct BNPL: Codable {
    var active: Bool
    var providers: [BNPLUsageProvider]
}

struct BNPLAccountProvider: Codable {
    var name: String
    var providers: Int
    var totalSpent: Double?

    enum CodingKeys: String, CodingKey {
        case name, providers
        case totalSpent = "total_spent"
    }
}

struct BNPLUsageProvider: Codable {
    var name: String
    var transactionsLast30Days: Int
    var totalSpent: Double?

    enum CodingKeys: String, CodingKey {
        case name
        case transactionsLast30Days = "transactions_last_30_days"
        case totalSpent = "total_spent"
    }
}

struct Transaction: Codable {
    var transactionId: String
    var accountId: String
    var date: String
    var description: String
    var amount: Double
    var category: String
    var type: String

    enum CodingKeys: String, CodingKey {
        case transactionId = "transaction_id"
        case accountId = "account_id"
        case date, description, amount, category, type
    }
}

struct PaymentHistory: Codable {
    var onTimePaymentsLast6Months: Int?
    var missedPaymentsLast6Months: Int?

    enum CodingKeys: String, CodingKey {
        case onTimePaymentsLast6Months = "on_time_payments_last_6_months"
        case missedPaymentsLast6Months = "missed_payments_last_6_months"
    }
}
