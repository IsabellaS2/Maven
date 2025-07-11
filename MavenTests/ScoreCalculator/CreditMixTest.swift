//
//  CreditMixTest.swift
//  Maven
//
//  Created by Isabella Sulisufi on 08/07/2025.
//


import XCTest
@testable import Maven

final class CreditMixTests: XCTestCase {

    func makeCreditCard() -> CreditCard {
        CreditCard(provider: "Test Bank", limit: 1000, balance: 100, lastLimitIncrease: nil, lastLimitDecrease: nil)
    }

    func makeLoan() -> Loan {
        Loan(provider: "Test Loan", amount: 5000, balanceRemaining: 4000, monthlyRepayment: 200, repaymentConsistency: "consistent")
    }

    func makeBNPL() -> BNPLUsageProvider {
        BNPLUsageProvider(name: "Testpay", transactionsLast30Days: 2, totalSpent: 150)
    }

    func testBalancedMixLoanAndCreditCard() {
        let cc = makeCreditCard()
        let loan = makeLoan()
        let bnpl: BNPLUsageProvider? = nil

        let score = calculateCreditMix(cc: cc, loan: loan, bnpl: bnpl)
        XCTAssertEqual(score, 45)
    }

    func testBalancedMixLoanCreditCardAndBNPL() {
        let cc = makeCreditCard()
        let loan = makeLoan()
        let bnpl = makeBNPL()

        let score = calculateCreditMix(cc: cc, loan: loan, bnpl: bnpl)
        XCTAssertEqual(score, 45)
    }

    func testSingleProductCreditCardOnly() {
        let cc = makeCreditCard()
        let loan: Loan? = nil
        let bnpl: BNPLUsageProvider? = nil

        let score = calculateCreditMix(cc: cc, loan: loan, bnpl: bnpl)
        XCTAssertEqual(score, 20)
    }

    func testSingleProductLoanOnly() {
        let cc: CreditCard? = nil
        let loan = makeLoan()
        let bnpl: BNPLUsageProvider? = nil

        let score = calculateCreditMix(cc: cc, loan: loan, bnpl: bnpl)
        XCTAssertEqual(score, 20)
    }

    func testOnlyBNPL() {
        let cc: CreditCard? = nil
        let loan: Loan? = nil
        let bnpl = makeBNPL()

        let score = calculateCreditMix(cc: cc, loan: loan, bnpl: bnpl)
        XCTAssertEqual(score, 15)
    }

    func testLoanAndBNPLNoCreditCard() {
        let cc: CreditCard? = nil
        let loan = makeLoan()
        let bnpl = makeBNPL()

        let score = calculateCreditMix(cc: cc, loan: loan, bnpl: bnpl)
        XCTAssertEqual(score, 20)
    }

    func testCreditCardAndBNPLNoLoan() {
        let cc = makeCreditCard()
        let loan: Loan? = nil
        let bnpl = makeBNPL()

        let score = calculateCreditMix(cc: cc, loan: loan, bnpl: bnpl)
        XCTAssertEqual(score, 20)
    }

    func testNoCreditProducts() {
        let cc: CreditCard? = nil
        let loan: Loan? = nil
        let bnpl: BNPLUsageProvider? = nil

        let score = calculateCreditMix(cc: cc, loan: loan, bnpl: bnpl)
        XCTAssertEqual(score, 10)
    }
}
