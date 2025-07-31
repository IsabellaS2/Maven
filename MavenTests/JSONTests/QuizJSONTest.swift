//
//  QuizJSONTest.swift
//  Maven
//
//  Created by Isabella Sulisufi on 31/07/2025.
//

import XCTest
@testable import Maven

class QuizDataTest: XCTestCase {

    func testQuizJSONDecoding() {
        let testBundle = Bundle(for: type(of: self))

        guard let quizData: QuizDatabase = loadJSON(fileName: "quiz", as: QuizDatabase.self, in: testBundle) else {
            XCTFail("Failed to decode quiz.json")
            return
        }

        // Ensure we have all expected categories
        XCTAssertTrue(quizData.keys.contains("understanding_apr_interest_charges"))
        XCTAssertTrue(quizData.keys.contains("credit_scores_reports"))
        XCTAssertTrue(quizData.keys.contains("credit_cards_basics"))
        XCTAssertTrue(quizData.keys.contains("bnpl_basics"))
        XCTAssertTrue(quizData.keys.contains("mortgage_basics"))
        XCTAssertTrue(quizData.keys.contains("personal_loans"))
        XCTAssertTrue(quizData.keys.contains("balance_transfers"))
        XCTAssertTrue(quizData.keys.contains("bank_accounts_savings"))

        // Check values in a representative section
        if let aprSet = quizData["understanding_apr_interest_charges"] {
            XCTAssertEqual(aprSet.title, "Understanding APR, Interest & Charges")
            XCTAssertEqual(aprSet.category, "Credit")
            XCTAssertEqual(aprSet.questions.count, 5)

            let first = aprSet.questions.first
            XCTAssertEqual(first?.question, "What does APR stand for?")
            XCTAssertEqual(first?.correctAnswer, "Annual Percentage Rate")
            XCTAssertTrue(first?.options.contains("Annual Payment Rate") ?? false)
        }

        // Check BNPL basics
        if let bnplSet = quizData["bnpl_basics"] {
            XCTAssertEqual(bnplSet.category, "Borrowing Money")
            XCTAssertEqual(bnplSet.questions.last?.correctAnswer, "Setting reminders for payments")
        }

        // Check Credit Cards basics
        if let cards = quizData["credit_cards_basics"] {
            XCTAssertEqual(cards.questions[2].question, "When do you pay interest on credit card purchases?")
            XCTAssertEqual(cards.questions[2].correctAnswer, "If you don’t pay the full balance by the due date")
        }
    }
}
