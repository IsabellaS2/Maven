//
//  SavingPresenceTest.swift
//  Maven
//
//  Created by Isabella Sulisufi on 06/07/2025.
//

import XCTest
@testable import Maven

final class SavingPresenceTest: XCTestCase {

    func testSavingsOver500Returns75() {
        let savings = SavingsAccount(
            accountId: "001",
            name: "Main Savings",
            balance: Balance(current: 750.0, currency: "GBP")
        )

        let score = calculateSavingsPresence(savingsAccounts: [savings])
        XCTAssertEqual(score, 75)
    }

    func testSavingsExactly500Returns40() {
           let savings = SavingsAccount(
               accountId: "002",
               name: "Exact 500",
               balance: Balance(current: 500.0, currency: "GBP")
           )

           let score = calculateSavingsPresence(savingsAccounts: [savings])
           XCTAssertEqual(score, 40)
       }

       func testSavingsBetween100And499Returns40() {
           let savings = SavingsAccount(
               accountId: "003",
               name: "Mid Range",
               balance: Balance(current: 250.0, currency: "GBP")
           )

           let score = calculateSavingsPresence(savingsAccounts: [savings])
           XCTAssertEqual(score, 40)
       }

       func testSavingsExactly100Returns40() {
           let savings = SavingsAccount(
               accountId: "004",
               name: "Exactly 100",
               balance: Balance(current: 100.0, currency: "GBP")
           )

           let score = calculateSavingsPresence(savingsAccounts: [savings])
           XCTAssertEqual(score, 40)
       }

       func testSavingsUnder100Returns10() {
           let savings = SavingsAccount(
               accountId: "005",
               name: "Low Balance",
               balance: Balance(current: 50.0, currency: "GBP")
           )

           let score = calculateSavingsPresence(savingsAccounts: [savings])
           XCTAssertEqual(score, 10)
       }

       func testSavingsExactlyZeroReturns10() {
           let savings = SavingsAccount(
               accountId: "006",
               name: "Zero Balance",
               balance: Balance(current: 0.0, currency: "GBP")
           )

           let score = calculateSavingsPresence(savingsAccounts: [savings])
           XCTAssertEqual(score, 10)
       }

       func testSavingsIsEmptyReturns25() {
           let score = calculateSavingsPresence(savingsAccounts: [])
           XCTAssertEqual(score, 25)
       }
}
