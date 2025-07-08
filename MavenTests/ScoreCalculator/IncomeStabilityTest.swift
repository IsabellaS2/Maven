//
//  IncomeStabilityTest.swift
//  Maven
//
//  Created by Isabella Sulisufi on 04/07/2025.
//

import XCTest
@testable import Maven

final class IncomeStabilityTest: XCTestCase {

    // MARK: - Monthly

    func testMonthlyIncomeAlwaysStable() {
        let income = Income(
            source: "Full-time Employment",
            frequency: "Monthly",
            averageAmount: 3500.0,
            lastPaidDate: "2025-06-10",
            nextExpectedDate: "2025-07-10",
            isStable: true
        )

        let score = calculateIncomeStability(income: income)

        XCTAssertEqual(income.frequency, "Monthly")
        XCTAssertTrue(income.isStable == true)
        XCTAssertEqual(score, 35)
    }
    
    func testMonthlyIncomeSometimesStable() {
        let income = Income(
            source: "Full-time Employment",
            frequency: "Monthly",
            averageAmount: 3500.0,
            lastPaidDate: "2025-06-05",
            nextExpectedDate: "2025-07-10",
            isStable: true
        )

        let score = calculateIncomeStability(income: income)

        XCTAssertEqual(income.frequency, "Monthly")
        XCTAssertTrue(income.isStable == true)
        XCTAssertEqual(score, 20)
    }
    
    func testMonthlyIncomeNotStable() {
        let income = Income(
            source: "Full-time Employment",
            frequency: "Monthly",
            averageAmount: 3500.0,
            lastPaidDate: "2025-06-25",
            nextExpectedDate: "2025-07-01",
            isStable: true
        )

        let score = calculateIncomeStability(income: income)

        XCTAssertEqual(income.frequency, "Monthly")
        XCTAssertEqual(score, 0)
    }
    
    // MARK: - Bi-Weekly

    func testBiweeklyIncomeAlwaysStable() {
        let income = Income(
            source: "Full-time Employment",
            frequency: "Bi-weekly",
            averageAmount: 3500.0,
            lastPaidDate: "2025-06-10",
            nextExpectedDate: "2025-06-24",
            isStable: true
        )
        
        let score = calculateIncomeStability(income: income)
        
        XCTAssertEqual(income.frequency, "Bi-weekly")
        XCTAssertTrue(income.isStable == true)
        XCTAssertEqual(score, 35)
    }
    
    func testBiweeklyIncomeSometimesStable() {
        let income = Income(
            source: "Full-time Employment",
            frequency: "Bi-weekly",
            averageAmount: 3500.0,
            lastPaidDate: "2025-06-05",
            nextExpectedDate: "2025-06-21",
            isStable: true
        )

        let score = calculateIncomeStability(income: income)

        XCTAssertEqual(income.frequency, "Bi-weekly")
        XCTAssertTrue(income.isStable == true)
        XCTAssertEqual(score, 20)
    }
    
    func testBiweeklyIncomeNotStable() {
        let income = Income(
            source: "Full-time Employment",
            frequency: "Bi-weekly",
            averageAmount: 3500.0,
            lastPaidDate: "2025-06-02",
            nextExpectedDate: "2025-06-21",
            isStable: true
        )

        let score = calculateIncomeStability(income: income)

        XCTAssertEqual(income.frequency, "Bi-weekly")
        XCTAssertEqual(score, 0)
    }
    
    // MARK: - Weekly

    func testWeeklyIncomeAlwaysStable() {
        let income = Income(
            source: "Full-time Employment",
            frequency: "Weekly",
            averageAmount: 3500.0,
            lastPaidDate: "2025-06-02",
            nextExpectedDate: "2025-06-10",
            isStable: true
        )
        
        let score = calculateIncomeStability(income: income)
        
        XCTAssertEqual(income.frequency, "Weekly")
        XCTAssertTrue(income.isStable == true)
        XCTAssertEqual(score, 35)
    }
    
    func testWeeklyIncomeSometimesStable() {
        let income = Income(
            source: "Full-time Employment",
            frequency: "Weekly",
            averageAmount: 3500.0,
            lastPaidDate: "2025-06-03",
            nextExpectedDate: "2025-06-12",
            isStable: true
        )

        let score = calculateIncomeStability(income: income)

        XCTAssertEqual(income.frequency, "Weekly")
        XCTAssertTrue(income.isStable == true)
        XCTAssertEqual(score, 20)
    }
    
    func testWeeklyIncomeNotStable() {
        let income = Income(
            source: "Full-time Employment",
            frequency: "Weekly",
            averageAmount: 3500.0,
            lastPaidDate: "2025-06-02",
            nextExpectedDate: "2025-06-21",
            isStable: false
        )

        let score = calculateIncomeStability(income: income)

        XCTAssertEqual(income.frequency, "Weekly")
        XCTAssertEqual(score, 0)
    }
    
    // MARK: - Edge Cases

    func testUnknownFrequencyReturnsZero() {
        let income = Income(
            source: "Contract Work",
            frequency: "Yearly",
            averageAmount: 1000.0,
            lastPaidDate: "2025-06-01",
            nextExpectedDate: "2026-06-01",
            isStable: true
        )

        let score = calculateIncomeStability(income: income)

        XCTAssertEqual(score, 0)
    }

    func testMissingLastPaidDateReturnsZero() {
        let income = Income(
            source: "Part-time Job",
            frequency: "Monthly",
            averageAmount: 1200.0,
            lastPaidDate: nil,
            nextExpectedDate: "2025-07-01",
            isStable: true
        )

        let score = calculateIncomeStability(income: income)

        XCTAssertEqual(score, 0)
    }

    func testMalformedDateReturnsZero() {
        let income = Income(
            source: "Freelance",
            frequency: "Monthly",
            averageAmount: 1500.0,
            lastPaidDate: "not-a-date",
            nextExpectedDate: "2025-07-01",
            isStable: true
        )

        let score = calculateIncomeStability(income: income)

        XCTAssertEqual(score, 0)
    }
    
    func testEmptyFrequencyReturnsZero() {
        let income = Income(
            source: "Gig Work",
            frequency: "",
            averageAmount: 900.0,
            lastPaidDate: "2025-06-01",
            nextExpectedDate: "2025-07-01",
            isStable: true
        )

        let score = calculateIncomeStability(income: income)

        XCTAssertEqual(score, 0)
    }
    
    func testEmptyIncomeFieldsReturnZero() {
        let income = Income(
            source: "",
            frequency: "",
            averageAmount: 0,
            lastPaidDate: nil,
            nextExpectedDate: nil,
            isStable: false
        )
        
        let score = calculateIncomeStability(income: income)
        
        XCTAssertEqual(score, 0)
    }

    func testNilIncomeReturnsZero() {
        let score = calculateIncomeStability(income: nil)
        XCTAssertEqual(score, 0)
    }
}
