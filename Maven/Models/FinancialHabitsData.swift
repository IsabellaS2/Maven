//
//  FinancialHabitsData.swift
//  Maven
//
//  Created by Isabella Sulisufi on 17/07/2025.
//

import Foundation

struct FinancialHabitsData: Codable {
    let whatsGoingWell: GoodHabitsCategory
    let whatNeedsImprovement: NeedsImprovementCategory

    enum CodingKeys: String, CodingKey {
        case whatsGoingWell = "whats_going_well"
        case whatNeedsImprovement = "what_needs_improvement"
    }
}

struct GoodHabitsCategory: Codable {
    let title: String
    let onTimeLoanPayments: Habit
    let healthySavings: Habit
    let stableIncome: Habit
    let smartBnplManagement: Habit
    let noLatePayments: Habit
    let lowDebtToIncome: Habit

    enum CodingKeys: String, CodingKey {
        case title
        case onTimeLoanPayments = "on_time_loan_payments"
        case healthySavings = "healthy_savings"
        case stableIncome = "stable_income"
        case smartBnplManagement = "smart_bnpl_management"
        case noLatePayments = "no_late_payments"
        case lowDebtToIncome = "low_debt_to_income"
    }
}

struct NeedsImprovementCategory: Codable {
    let title: String
    let missedCreditCards: Habit
    let highBnplUsage: Habit
    let lowSavings: Habit
    let overLimitSpending: Habit
    let missedLoanPayments: Habit
    let highDebtToIncome: Habit

    enum CodingKeys: String, CodingKey {
        case title
        case missedCreditCards = "missed_credit_cards"
        case highBnplUsage = "high_bnpl_usage"
        case lowSavings = "low_savings"
        case overLimitSpending = "over_limit_spending"
        case missedLoanPayments = "missed_loan_payments"
        case highDebtToIncome = "high_debt_to_income"
    }
}

struct Habit: Codable {
    let title: String
    let description1: String
    let description2: String

    enum CodingKeys: String, CodingKey {
        case title
        case description1 = "description_1"
        case description2 = "description_2"
    }
}

struct HabitCard {
    let shouldShow: (Behaviour) -> Bool
    let title: String
    let description1: String
    let description2: String
}
