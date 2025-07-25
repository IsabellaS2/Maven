//
//  DebtToIncomeRatioTest.swift
//  Maven
//
//  Created by Isabella Sulisufi on 07/07/2025.
//

import XCTest
@testable import Maven

final class DebtToIncomeRatioTest: XCTestCase {

    func makeBehaviour(incomeAmount: Double?, ratio: Double?) -> Behaviour {
        let income = incomeAmount != nil ? Income(
            source: "Job",
            frequency: "Monthly",
            averageAmount: incomeAmount!,
            lastPaidDate: nil,
            nextExpectedDate: nil,
            isStable: true
        ) : nil

        return Behaviour(
            accounts: nil,
            income: income,
            creditCards: nil,
            loans: nil,
            bnpl: nil,
            transactions: [],
            categories: [],
            debtToIncomeRatio: ratio,
            lastPaidDate: nil
        )
    }

    func testRatioBelowPointThreeReturns50() {
         let behaviour = makeBehaviour(incomeAmount: 2000, ratio: 0.29)
         XCTAssertEqual(calculateDebtToIncomeRatio(data: behaviour), 50)
     }

     func testRatioBetweenPointThreeAndPointFiveReturns30() {
         let behaviour = makeBehaviour(incomeAmount: 3000, ratio: 0.3)
         XCTAssertEqual(calculateDebtToIncomeRatio(data: behaviour), 30)

         let behaviour2 = makeBehaviour(incomeAmount: 3000, ratio: 0.5)
         XCTAssertEqual(calculateDebtToIncomeRatio(data: behaviour2), 30)
     }

     func testRatioAbovePointFiveReturns10() {
         let behaviour = makeBehaviour(incomeAmount: 5000, ratio: 0.51)
         XCTAssertEqual(calculateDebtToIncomeRatio(data: behaviour), 10)
     }

    func testNoIncomeNoDebt() {
        let behaviour = makeBehaviour(incomeAmount: nil, ratio: nil)
        XCTAssertEqual(calculateDebtToIncomeRatio(data: behaviour), 25)
    }

    func testNoIncomeWithDebt() {
        let behaviour = makeBehaviour(incomeAmount: nil, ratio: 0.5)
        XCTAssertEqual(calculateDebtToIncomeRatio(data: behaviour), 0)
    }

    func testIncomeButNoRatio() {
        let behaviour = makeBehaviour(incomeAmount: 2500, ratio: nil)
        XCTAssertEqual(calculateDebtToIncomeRatio(data: behaviour), 0)
    }

    func testNilData() {
        XCTAssertEqual(calculateDebtToIncomeRatio(data: nil), 0)
    }
}
