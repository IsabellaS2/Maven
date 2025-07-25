//
//  CreditUtilisationTest.swift
//  Maven
//
//  Created by Isabella Sulisufi on 07/07/2025.
//

import XCTest
@testable import Maven

final class CreditUtilisationTest: XCTestCase {

    func testUtilisationLessThanPoint3() {
        let creditCard = CreditCard(
            provider: "Test Bank",
            limit: 1200.00,
            balance: 200.00,
            lastLimitIncrease: "2025-06-20",
            lastLimitDecrease: nil
        )
        let score = calculateCreditUtilisation(creditCard: creditCard)

        XCTAssertEqual(score, 135)
        let utilisation = creditCard.balance / creditCard.limit
        XCTAssertEqual(utilisation * creditCard.limit, creditCard.balance, accuracy: 0.0001)
    }

    func testUtilisationIsPoint3() {
        let creditCard = CreditCard(
            provider: "Test Bank",
            limit: 1000.00,
            balance: 300.00,
            lastLimitIncrease: "2025-06-20",
            lastLimitDecrease: nil
        )
        let score = calculateCreditUtilisation(creditCard: creditCard)
        XCTAssertEqual(score, 80)

        let utilisation = creditCard.balance / creditCard.limit
        XCTAssertEqual(utilisation * creditCard.limit, creditCard.balance, accuracy: 0.0001)
    }

    func testUtilisationBetweenPoint3AndPoint49() {
        let creditCard = CreditCard(
            provider: "Test Bank",
            limit: 1000.00,
            balance: 400.00,
            lastLimitIncrease: "2025-06-20",
            lastLimitDecrease: nil
        )
        let score = calculateCreditUtilisation(creditCard: creditCard)
        XCTAssertEqual(score, 80)

        let utilisation = creditCard.balance / creditCard.limit
        XCTAssertEqual(utilisation * creditCard.limit, creditCard.balance, accuracy: 0.0001)
    }

    func testUtilisationBetweenPoint5AndPoint74() {
        let creditCard = CreditCard(
            provider: "Test Bank",
            limit: 1000.00,
            balance: 620.00,
            lastLimitIncrease: "2025-06-20",
            lastLimitDecrease: nil
        )
        let score = calculateCreditUtilisation(creditCard: creditCard)
        XCTAssertEqual(score, 40)

        let utilisation = creditCard.balance / creditCard.limit
        XCTAssertEqual(utilisation * creditCard.limit, creditCard.balance, accuracy: 0.0001)
    }

    func testUtilisationEqualToPoint75() {
        let creditCard = CreditCard(
            provider: "Test Bank",
            limit: 1000.00,
            balance: 750.00,
            lastLimitIncrease: "2025-06-20",
            lastLimitDecrease: nil
        )
        let score = calculateCreditUtilisation(creditCard: creditCard)
        XCTAssertEqual(score, 0)

        let utilisation = creditCard.balance / creditCard.limit
        XCTAssertEqual(utilisation * creditCard.limit, creditCard.balance, accuracy: 0.0001)
    }

    func testUtilisationGreaterThanToPoint75() {
        let creditCard = CreditCard(
            provider: "Test Bank",
            limit: 1000.00,
            balance: 800.00,
            lastLimitIncrease: "2025-06-20",
            lastLimitDecrease: nil
        )
        let score = calculateCreditUtilisation(creditCard: creditCard)
        XCTAssertEqual(score, 0)

        let utilisation = creditCard.balance / creditCard.limit
        XCTAssertEqual(utilisation * creditCard.limit, creditCard.balance, accuracy: 0.0001)
    }

    func testNoCreditCardReturnsFallbackScore() {
        let score = calculateCreditUtilisation(creditCard: nil)
        XCTAssertEqual(score, 35)
    }

    func testZeroBalanceAndLimit() {
        let creditCard = CreditCard(
            provider: "Test Bank",
            limit: 0.00,
            balance: 0.00,
            lastLimitIncrease: "2025-06-20",
            lastLimitDecrease: nil
        )

        let score = calculateCreditUtilisation(creditCard: creditCard)
        XCTAssertEqual(score, 35)
    }

    func testNegativeBalance() {
        let creditCard = CreditCard(
            provider: "Test Bank",
            limit: 1000.00,
            balance: -50.00,
            lastLimitIncrease: "2025-06-20",
            lastLimitDecrease: nil
        )

        let score = calculateCreditUtilisation(creditCard: creditCard)
        XCTAssertEqual(score, 135) // 0% utilisation
    }

    func testBalanceExceedsLimit() {
        let creditCard = CreditCard(
            provider: "Test Bank",
            limit: 1000.00,
            balance: 1200.00,
            lastLimitIncrease: "2025-06-20",
            lastLimitDecrease: nil
        )

        let score = calculateCreditUtilisation(creditCard: creditCard)
        XCTAssertEqual(score, 0) // Over-limit usage
    }
}
