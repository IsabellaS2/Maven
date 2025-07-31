//
//  UserScenarioJSONTest.swift
//  Maven
//
//  Created by Isabella Sulisufi on 31/07/2025.
//

import XCTest
@testable import Maven

final class UserScenarioJSONTest: XCTestCase {

    func testUserScenariosDecoding() {
        let testBundle = Bundle(for: type(of: self))

        guard let scenarios = loadJSON(fileName: "scenarios", as: UserScenarios.self, in: testBundle) else {
            XCTFail("Failed to decode scenarios.json")
            return
        }

        // MARK: - Test Ellie
        XCTAssertEqual(scenarios.elliesCreditCardStruggles.title, "Ellie’s Credit Card Struggles")
        XCTAssertEqual(scenarios.elliesCreditCardStruggles.whatWentWrong.text1, "💰 Ellie didn’t budget her spending - she spent more than she had and didn’t pay it off in time.")

        //  MARK: - Test Maria
        XCTAssertEqual(scenarios.mariasBnplTrouble.subtitle, "User Scenario - BNPL")
        XCTAssertEqual(scenarios.mariasBnplTrouble.howToSort.text3, "🚫 Avoid making new BNPL purchases until her current balances are clear.")

        //  MARK: - Test Marcus
        XCTAssertEqual(scenarios.marcussMortgageMisunderstanding.description4, "Now he realises his monthly expenses are higher than expected.")
        XCTAssertEqual(scenarios.marcussMortgageMisunderstanding.haveDoneDifferently.text2, "💰 Save more upfront to reduce his monthly mortgage.")

        //  MARK: - Test Sarah
        XCTAssertEqual(scenarios.sarahsCreditCardBalanceTransferMisstep.title, "Sarah’s Credit Card Balance Transfer Misstep")
        XCTAssertEqual(scenarios.sarahsCreditCardBalanceTransferMisstep.solutionsAndResources.text3, "Have a clear strategy to pay off debt before the promotional period ends.")

        //  MARK: - Test Jake
        XCTAssertEqual(scenarios.jakesDebtManagementStruggles.whatWentWrong.title, "What did Jake do wrong?")
        XCTAssertEqual(scenarios.jakesDebtManagementStruggles.solutionsAndResources.text2, "Debt consolidation can help simplify payments and potentially reduce interest rates.")

        //  MARK: - Test Mofiz
        XCTAssertEqual(scenarios.mofizsCarLoanOversight.subtitle, "User Scenario - Car Loans")
        XCTAssertEqual(scenarios.mofizsCarLoanOversight.haveDoneDifferently.text3, "💬 Consulted with a financial advisor or used online calculators to plan his car budget realistically.")
    }
}
