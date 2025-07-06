
//
//  Accounts.swift
//

import Foundation

struct Accounts: Codable {
    var savingsAccounts: [SavingsAccount]?
    var creditCards: [CreditCard]?
    var loans: [Loan]?
    var bnplProviders: [BNPLUsageProvider]?
    var transactions: [Transaction]?
    var creditScore: CreditScore

    enum CodingKeys: String, CodingKey {
        case savingsAccounts = "savings_accounts"
        case creditCards = "credit_cards"
        case loans, transactions
        case bnplProviders = "bnpl_providers"
        case creditScore = "credit_score"
    }
}

struct CurrentAccount: Codable {
    var accountId: String
    var name: String
    var balance: Balance
    var sortCode: String
    var accountNumber: String

    enum CodingKeys: String, CodingKey {
        case accountId, name, balance
        case sortCode = "sort_code"
        case accountNumber = "account_number"
    }
}

struct SavingsAccount: Codable {
    var accountId: String
    var name: String
    var balance: Balance

    enum CodingKeys: String, CodingKey {
        case accountId = "account_id"
        case name, balance
    }
}

struct Balance: Codable {
    var current: Double
    var currency: String
}

