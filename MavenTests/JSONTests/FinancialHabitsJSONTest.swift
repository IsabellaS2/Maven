//
//  FinancialHabitsJSONTest.swift
//  Maven
//
//  Created by Isabella Sulisufi on 31/07/2025.
//

import XCTest
@testable import Maven

class FinancialHabitsJSONTest: XCTestCase {

    func testFinancialHabitsJSON() {
        let testBundle = Bundle(for: type(of: self))

        guard let habits: FinancialHabitsData = loadJSON(fileName: "financialHabits", as: FinancialHabitsData.self, in: testBundle) else {
            XCTFail("Failed to load habits.json")
            return
        }

        // MARK: - Good Habits
        let good = habits.whatsGoingWell

        XCTAssertEqual(good.title, "✅ What’s Going Well")
        XCTAssertEqual(good.onTimeLoanPayments.title, "💸 On-time Loan Payments")
        XCTAssertEqual(good.healthySavings.description2, "Continue to add to your savings for future security.")
        XCTAssertEqual(good.stableIncome.title, "💼 Stable Income")
        XCTAssertEqual(good.noLatePayments.description1, "You’ve avoided late payments—great job!")

        // MARK: - Improvement Areas
        let bad = habits.whatNeedsImprovement

        XCTAssertEqual(bad.title, "⚠️ What Needs Improvement")
        XCTAssertEqual(bad.missedCreditCards.title, "💳 Missed Credit Card Payments")
        XCTAssertEqual(bad.lowSavings.description2, "Try setting up automatic transfers to build your savings.")
        XCTAssertEqual(bad.overLimitSpending.description1, "Exceeding your credit limit can harm your score and incur extra fees.")
        XCTAssertEqual(bad.highDebtToIncome.title, "📊 High Debt-to-Income Ratio")
    }
}
