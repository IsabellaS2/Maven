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
    var categories: [Category]?
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
    var totalSpent: Double

    enum CodingKeys: String, CodingKey {
        case name, providers
        case totalSpent = "total_spent"
    }
}

struct BNPLUsageProvider: Codable {
    var name: String
    var transactionsLast30Days: Int
    var totalSpent: Double

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
    var category: Category
    var type: String

    enum CodingKeys: String, CodingKey {
        case transactionId = "transactionId"
        case accountId, date, description, amount, category, type
    }
}

struct Category: Codable {
    var id: String
    var name: String

    enum CodingKeys: String, CodingKey {
        case id, name
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

//struct CreditScore: Codable {
//    var score: Int
//    var band: String
//    var debtToIncomeRatio: Double?
//    var lastPaidDate: String?
//
//    enum CodingKeys: String, CodingKey {
//        case score, band
//        case debtToIncomeRatio = "debt_to_income_ratio"
//        case lastPaidDate = "last_paid_date"
//    }
//}
