//
//  IncomeStabilityTest.swift
//  Maven
//
//  Created by Isabella Sulisufi on 04/07/2025.
//

import XCTest
@testable import Maven

final class IncomeStabilityTest: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    // MARK: - Monthly

    func testMonthlyIncomeAlwaysStable() {
        // GIVEN
        let monthlyStableIncome = Income(
            source: "Full-time Employment",
            frequency: "Monthly",
            averageAmount: 3500.0,
            lastPaidDate: "2025-06-10",
            nextExpectedDate: "2025-07-10",
            isStable: true
        )

        // WHEN
        let score = calculateIncomeStability(income: monthlyStableIncome)

        // THEN
        XCTAssertEqual(monthlyStableIncome.frequency, "Monthly")
        XCTAssertTrue(monthlyStableIncome.isStable)
        XCTAssertEqual(score, 35)

    }
    
    func testMonthlyIncomeSometimesStable() {
        // GIVEN
        let monthlyStableIncome = Income(
            source: "Full-time Employment",
            frequency: "Monthly",
            averageAmount: 3500.0,
            lastPaidDate: "2025-06-05",
            nextExpectedDate: "2025-07-10",
            isStable: true
        )

        // WHEN
        let score = calculateIncomeStability(income: monthlyStableIncome)

        // THEN
        XCTAssertEqual(monthlyStableIncome.frequency, "Monthly")
        XCTAssertTrue(monthlyStableIncome.isStable)
        XCTAssertEqual(score, 20)
    }
    
    func testMonthlyIncomeNotStable() {
        // GIVEN
        let monthlyStableIncome = Income(
            source: "Full-time Employment",
            frequency: "Monthly",
            averageAmount: 3500.0,
            lastPaidDate: "2025-06-25",
            nextExpectedDate: "2025-07-01",
            isStable: true
        )

        // WHEN
        let score = calculateIncomeStability(income: monthlyStableIncome)

        // THEN
        XCTAssertEqual(monthlyStableIncome.frequency, "Monthly")
        XCTAssertEqual(score, 0)
    }
    
    // MARK: - Bi-Weekly
    func testBiweeklyIncomeAlwaysStable() {
        // GIVEN
        let monthlyStableIncome = Income(
            source: "Full-time Employment",
            frequency: "Bi-weekly",
            averageAmount: 3500.0,
            lastPaidDate: "2025-06-10",
            nextExpectedDate: "2025-06-24",
            isStable: true
        )
        
        // WHEN
        let score = calculateIncomeStability(income: monthlyStableIncome)
        
        // THEN
        XCTAssertEqual(monthlyStableIncome.frequency, "Bi-weekly")
        XCTAssertTrue(monthlyStableIncome.isStable)
        XCTAssertEqual(score, 35)
    }
    
    func testBiweeklyIncomeSometimesStable() {
        // GIVEN
        let monthlyStableIncome = Income(
            source: "Full-time Employment",
            frequency: "Bi-weekly",
            averageAmount: 3500.0,
            lastPaidDate: "2025-06-05",
            nextExpectedDate: "2025-06-21",
            isStable: true
        )

        // WHEN
        let score = calculateIncomeStability(income: monthlyStableIncome)

        // THEN
        XCTAssertEqual(monthlyStableIncome.frequency, "Bi-weekly")
        XCTAssertTrue(monthlyStableIncome.isStable)
        XCTAssertEqual(score, 20)
    }
    
    func testBiweeklyIncomeNotStable() {
        // GIVEN
        let monthlyStableIncome = Income(
            source: "Full-time Employment",
            frequency: "Bi-weekly",
            averageAmount: 3500.0,
            lastPaidDate: "2025-06-02",
            nextExpectedDate: "2025-06-21",
            isStable: true
        )

        // WHEN
        let score = calculateIncomeStability(income: monthlyStableIncome)

        // THEN
        XCTAssertEqual(monthlyStableIncome.frequency, "Bi-weekly")
        XCTAssertEqual(score, 0)
    }
    
    // MARK: - Weekly
    func testWeeklyIncomeAlwaysStable() {
        // GIVEN
        let monthlyStableIncome = Income(
            source: "Full-time Employment",
            frequency: "Weekly",
            averageAmount: 3500.0,
            lastPaidDate: "2025-06-02",
            nextExpectedDate: "2025-06-10",
            isStable: true
        )
        
        // WHEN
        let score = calculateIncomeStability(income: monthlyStableIncome)
        
        // THEN
        XCTAssertEqual(monthlyStableIncome.frequency, "Weekly")
        XCTAssertTrue(monthlyStableIncome.isStable)
        XCTAssertEqual(score, 35)
    }
    
    func testWeeklyIncomeSometimesStable() {
        // GIVEN
        let monthlyStableIncome = Income(
            source: "Full-time Employment",
            frequency: "Weekly",
            averageAmount: 3500.0,
            lastPaidDate: "2025-06-03",
            nextExpectedDate: "2025-06-12",
            isStable: true
        )

        // WHEN
        let score = calculateIncomeStability(income: monthlyStableIncome)

        // THEN
        XCTAssertEqual(monthlyStableIncome.frequency, "Weekly")
        XCTAssertTrue(monthlyStableIncome.isStable)
        XCTAssertEqual(score, 20)
    }
    
    func testWeeklyIncomeNotStable() {
        // GIVEN
        let monthlyStableIncome = Income(
            source: "Full-time Employment",
            frequency: "Weekly",
            averageAmount: 3500.0,
            lastPaidDate: "2025-06-02",
            nextExpectedDate: "2025-06-21",
            isStable: false
        )

        // WHEN
        let score = calculateIncomeStability(income: monthlyStableIncome)

        // THEN
        XCTAssertEqual(monthlyStableIncome.frequency, "Weekly")
        XCTAssertEqual(score, 0)
    }
    
    // MARK: - Edge Cases
    func testUnknownFrequencyReturnsZero() {
        let income = Income(
            source: "Contract Work",
            frequency: "Yearly", // unexpected frequency
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
            lastPaidDate: nil,  // missing date
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
}
