//
//  PaymentHistoryTest.swift
//  Maven
//
//  Created by Isabella Sulisufi on 08/07/2025.
//

import XCTest
@testable import Maven

final class PaymentHistoryTests: XCTestCase {

    func testNilPaymentHistoryReturnsNeutralScore() {
        let score = calculatePaymentHistory(paymentHistory: nil)
        XCTAssertEqual(score, 100)
    }

    func testNilOnTimeAndMissedPaymentsReturnsNeutralScore() {
        let paymentHistory = PaymentHistory(onTimePaymentsLast6Months: nil, missedPaymentsLast6Months: nil)
        let score = calculatePaymentHistory(paymentHistory: paymentHistory)
        XCTAssertEqual(score, 100)
    }

    func testNoMissedAndAtLeastOneOnTimeReturnsMaxScore() {
        let paymentHistory = PaymentHistory(onTimePaymentsLast6Months: 6, missedPaymentsLast6Months: 0)
        let score = calculatePaymentHistory(paymentHistory: paymentHistory)
        XCTAssertEqual(score, 200)
    }

    func testOneMissedAndSomeOnTimeReturns120() {
        let paymentHistory = PaymentHistory(onTimePaymentsLast6Months: 3, missedPaymentsLast6Months: 1)
        let score = calculatePaymentHistory(paymentHistory: paymentHistory)
        XCTAssertEqual(score, 120)
    }

    func testTwoOrThreeMissedAndSomeOnTimeReturns80() {
        let paymentHistory2 = PaymentHistory(onTimePaymentsLast6Months: 4, missedPaymentsLast6Months: 2)
        let paymentHistory3 = PaymentHistory(onTimePaymentsLast6Months: 5, missedPaymentsLast6Months: 3)

        XCTAssertEqual(calculatePaymentHistory(paymentHistory: paymentHistory2), 80)
        XCTAssertEqual(calculatePaymentHistory(paymentHistory: paymentHistory3), 80)
    }

    func testFourOrMoreMissedWithOnTimeReturns30() {
        let paymentHistory = PaymentHistory(onTimePaymentsLast6Months: 2, missedPaymentsLast6Months: 4)
        let score = calculatePaymentHistory(paymentHistory: paymentHistory)
        XCTAssertEqual(score, 30)
    }

    func testFourOrMoreMissedAndNoOnTimeReturns10() {
        let paymentHistory = PaymentHistory(onTimePaymentsLast6Months: 0, missedPaymentsLast6Months: 5)
        let score = calculatePaymentHistory(paymentHistory: paymentHistory)
        XCTAssertEqual(score, 10)
    }

    func testOtherCasesReturnNeutral() {
        let paymentHistory = PaymentHistory(onTimePaymentsLast6Months: 0, missedPaymentsLast6Months: 0)
        let score = calculatePaymentHistory(paymentHistory: paymentHistory)
        XCTAssertEqual(score, 100)
    }
}
