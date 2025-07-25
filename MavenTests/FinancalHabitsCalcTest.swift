//
//  FinancialHabitsCardCalcTests.swift
//  MavenTests
//
//  Created by Isabella Sulisufi on 18/07/2025.
//

import XCTest
@testable import Maven

final class FinancialHabitsCardCalcTests: XCTestCase {

    // MARK: - Going Well

    func testShouldShowOnTimeLoanPayments_true() {
        let loans = [
            Loan(
                provider: "TestBank",
                amount: 1000,
                balanceRemaining: 200,
                monthlyRepayment: 50,
                repaymentConsistency: "always_consistent"
            )
        ]
        XCTAssertTrue(shouldShowOnTimeLoanPayments(loans))
    }

    func testShouldShowOnTimeLoanPayments_false() {
        XCTAssertFalse(shouldShowOnTimeLoanPayments([]))
    }

    func testShouldShowHealthySavings_true() {
        let savings = [
            SavingsAccount(
                accountId: "save_001",
                name: "Easy Saver",
                balance: Balance(current: 500, currency: "GBP")
            )
        ]
        XCTAssertTrue(shouldShowHealthySavings(savings))
    }

    func testShouldShowHealthySavings_false() {
        let savings = [
            SavingsAccount(
                accountId: "save_001",
                name: "Easy Saver",
                balance: Balance(current: 250, currency: "GBP")
            )
        ]
        XCTAssertFalse(shouldShowHealthySavings(savings))
    }

    func testShouldShowStableIncome_true() {
        let income = Income(
            source: "",
            frequency: "",
            averageAmount: 0,
            lastPaidDate: nil,
            nextExpectedDate: nil,
            isStable: true
        )
        XCTAssertTrue(shouldShowStableIncome(income))
    }

    func testShouldShowSmartBNPL_true() {
        let providers = [
            BNPLUsageProvider(name: "Klarna", transactionsLast30Days: 1, totalSpent: nil)
        ]
        XCTAssertTrue(shouldShowSmartBNPL(providers))
    }

    func testShouldShowNoLatePayments_true() {
        let history = PaymentHistory(onTimePaymentsLast6Months: 6, missedPaymentsLast6Months: 0)
        XCTAssertTrue(shouldShowNoLatePayments(history))
    }

    func testShouldShowLowDTI_true() {
        XCTAssertTrue(shouldShowLowDTI(0.2))
    }

    // MARK: - Needs Improvement

    func testShouldShowMissedCreditCardPayments_true() {
        let history = PaymentHistory(onTimePaymentsLast6Months: 3, missedPaymentsLast6Months: 1)
        XCTAssertTrue(shouldShowMissedCreditCardPayments(history))
    }

    func testShouldShowHighBNPLUsage_true() {
        let providers = [
            BNPLUsageProvider(name: "Clearpay", transactionsLast30Days: 4, totalSpent: nil)
        ]
        XCTAssertTrue(shouldShowHighBNPLUsage(providers))
    }

    func testShouldShowLowSavings_true() {
        let savings = [
            SavingsAccount(
                accountId: "save_001",
                name: "Easy Saver",
                balance: Balance(current: 190, currency: "GBP")
            ),
            SavingsAccount(
                accountId: "save_001",
                name: "Easy Saver",
                balance: Balance(current: 300, currency: "GBP")
            )
        ]
        XCTAssertTrue(shouldShowLowSavings(savings))
    }

    func testShouldShowOverLimitSpending_true() {
        let cards = [
            CreditCard(
                provider: "Capital One",
                limit: 1000,
                balance: 1200,
                lastLimitIncrease: nil,
                lastLimitDecrease: nil
            )
        ]
        XCTAssertTrue(shouldShowOverLimitSpending(cards))
    }

    func testShouldShowMissedLoanPayments_true() {
        let loans = [
            Loan(
                provider: "NatWest",
                amount: 1000,
                balanceRemaining: 500,
                monthlyRepayment: 100,
                repaymentConsistency: "sometimes_late"
            )
        ]
        XCTAssertTrue(shouldShowMissedLoanPayments(loans))
    }

    func testShouldShowHighDTI_true() {
        XCTAssertTrue(shouldShowHighDTI(0.35))
    }
}
