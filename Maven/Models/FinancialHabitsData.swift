//
//  FinancialHabitsData.swift
//  Maven
//
//  Created by Isabella Sulisufi on 17/07/2025.
//

import Foundation

struct FinancialHabitsData: Codable {
    let whats_going_well: GoodHabitsCategory
    let what_needs_improvement: NeedsImprovementCategory
}

struct GoodHabitsCategory: Codable {
    let title: String
    let on_time_loan_payments: Habit
    let healthy_savings: Habit
    let stable_income: Habit
    let smart_bnpl_management: Habit
    let no_late_payments: Habit
    let low_debt_to_income: Habit
}

struct NeedsImprovementCategory: Codable {
    let title: String
    let missed_credit_cards: Habit
    let high_bnpl_usage: Habit
    let low_savings: Habit
    let over_limit_spending: Habit
    let missed_loan_payments: Habit
    let high_debt_to_income: Habit
}

struct Habit: Codable {
    let title: String
    let description_1: String
    let description_2: String
}

struct HabitCard {
    let shouldShow: (Behaviour) -> Bool
    let title: String
    let description1: String
    let description2: String
}
