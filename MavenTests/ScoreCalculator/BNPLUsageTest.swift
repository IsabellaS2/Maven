//
//  BNPLUsageTest.swift
//  Maven
//
//  Created by Isabella Sulisufi on 06/07/2025.
//

import XCTest
@testable import Maven

final class BNPLUsageTest: XCTestCase {

    func testZeroTransactionsReturns80() {
        let usage = BNPLUsageProvider(
            name: "Test Bank",
            transactionsLast30Days: 0,
            totalSpent: 25.00
        )

        let score = calculateBNPLUsageInLast30Days(bnplUsage: usage)
        XCTAssertEqual(score, 80)
    }

    func testOneTransactionsReturns80() {
        let usage = BNPLUsageProvider(
            name: "Test Bank",
            transactionsLast30Days: 1,
            totalSpent: 25.00
        )

        let score = calculateBNPLUsageInLast30Days(bnplUsage: usage)
        XCTAssertEqual(score, 80)
    }

    func testTwoTransactionsReturns50() {
        let usage = BNPLUsageProvider(
            name: "Test Bank",
            transactionsLast30Days: 2,
            totalSpent: 25.00
        )

        let score = calculateBNPLUsageInLast30Days(bnplUsage: usage)
        XCTAssertEqual(score, 50)
    }

    func testThreeTransactionsReturns50() {
        let usage = BNPLUsageProvider(
            name: "Test Bank",
            transactionsLast30Days: 3,
            totalSpent: 25.00
        )

        let score = calculateBNPLUsageInLast30Days(bnplUsage: usage)
        XCTAssertEqual(score, 50)
    }

    func testFourTransactionsReturns0() {
        let usage = BNPLUsageProvider(
            name: "Test Bank",
            transactionsLast30Days: 4,
            totalSpent: 25.00
        )

        let score = calculateBNPLUsageInLast30Days(bnplUsage: usage)
        XCTAssertEqual(score, 0)
    }

    func testMoreThanFourTransactionsReturns0() {
        let usage = BNPLUsageProvider(
            name: "Test Bank",
            transactionsLast30Days: 6,
            totalSpent: 25.00
        )

        let score = calculateBNPLUsageInLast30Days(bnplUsage: usage)
        XCTAssertEqual(score, 0)
    }

    func testNoBNPLDataReturns35() {
        let score = calculateBNPLUsageInLast30Days(bnplUsage: nil)
        XCTAssertEqual(score, 35)
    }

    func testNegativeTransactions_returns35() {
        let usage = BNPLUsageProvider(
            name: "Test Bank",
            transactionsLast30Days: -1,
            totalSpent: 25.00
        )

        let score = calculateBNPLUsageInLast30Days(bnplUsage: usage)
        XCTAssertEqual(score, 35)
    }
}
