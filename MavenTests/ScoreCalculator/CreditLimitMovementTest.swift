//
//  CreditLimitMovementTest.swift
//  Maven
//
//  Created by Isabella Sulisufi on 07/07/2025.
//

import XCTest
@testable import Maven

final class CreditLimitMovementTest: XCTestCase {

    var fakeToday: Date!

    override func setUp() {
        super.setUp()
        fakeToday = parseDate("2025-07-07")
    }

    override func tearDown() {
        fakeToday = nil
        super.tearDown()
    }

    func creditIncreaseinLast30DaysReurns45() {
        let creditCard = CreditCard(
            provider: "Test Bank",
            limit: 400.00,
            balance: 100.00,
            lastLimitIncrease: "2025-06-20",
            lastLimitDecrease: nil
        )
        let score = calculateCreditLimitMovement(creditCard: creditCard, today: fakeToday)
        XCTAssertEqual(score, 45)
    }

    func testCreditIncreaseExactly30DaysAgoReturns45() {
        let creditCard = CreditCard(
            provider: "Test Bank",
            limit: 1000.00,
            balance: 300.00,
            lastLimitIncrease: "2025-06-07",
            lastLimitDecrease: nil
        )
        let score = calculateCreditLimitMovement(creditCard: creditCard, today: fakeToday)
        XCTAssertEqual(score, 45)
    }

    func testNoCreditCardReturns20() {
        let score = calculateCreditLimitMovement(creditCard: nil, today: fakeToday)
        XCTAssertEqual(score, 20)
    }

    func testCreditIncreaseExactly31DaysAgoReturns10() {
        let creditCard = CreditCard(
            provider: "Test Bank",
            limit: 1000.00,
            balance: 300.00,
            lastLimitIncrease: "2025-06-06",
            lastLimitDecrease: nil
        )
        let score = calculateCreditLimitMovement(creditCard: creditCard, today: fakeToday)
        XCTAssertEqual(score, 10)
    }

    func testCreditWithNoIncreaseReturns10() {
        let creditCard = CreditCard(
            provider: "Test Bank",
            limit: 400.00,
            balance: 100.00,
            lastLimitIncrease: nil,
            lastLimitDecrease: nil
        )
        let score = calculateCreditLimitMovement(creditCard: creditCard, today: fakeToday)
        XCTAssertEqual(score, 10)
    }

    func testMalformedDateIncreaseDateReturns10() {
        let creditCard = CreditCard(
            provider: "Test Bank",
            limit: 1000.00,
            balance: 300.00,
            lastLimitIncrease: "07-01-2025",
            lastLimitDecrease: nil
        )
        let score = calculateCreditLimitMovement(creditCard: creditCard, today: fakeToday)
        XCTAssertEqual(score, 10)
    }

    func testCreditWithDecreaseReturns0() {
        let creditCard = CreditCard(
            provider: "Test Bank",
            limit: 400.00,
            balance: 100.00,
            lastLimitIncrease: nil,
            lastLimitDecrease: "2025-06-20"
        )
        let score = calculateCreditLimitMovement(creditCard: creditCard, today: fakeToday)
        XCTAssertEqual(score, 0)
    }

    func testCreditIncreaseAndDecreasePresentReturns0() {
        let creditCard = CreditCard(
            provider: "Test Bank",
            limit: 1000.00,
            balance: 300.00,
            lastLimitIncrease: "2025-07-01",
            lastLimitDecrease: "2025-06-30"
        )
        let score = calculateCreditLimitMovement(creditCard: creditCard, today: fakeToday)
        XCTAssertEqual(score, 0)
    }
}
