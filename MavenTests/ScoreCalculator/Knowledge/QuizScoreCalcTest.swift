//
//  QuizScoreCalcTest.swift
//  Maven
//
//  Created by Isabella Sulisufi on 15/07/2025.
//

import XCTest
@testable import Maven

final class QuizScoreCalcTest: XCTestCase {
    let fixedNow = parseDate("2025-08-20")!

    func testTwoQuizzes() {
        let quizzes = [
            QuizItem(id: "quiz_001", completedOn: "2025-07-01", score: 10, maxScore: 15, expiresOn: "2025-10-01"),
            QuizItem(id: "quiz_002", completedOn: "2025-05-15", score: 15, maxScore: 15, expiresOn: "2025-08-15") // expired
        ]
        let total = calculateTotalValidQuizPoints(from: quizzes, currentDate: fixedNow)
        XCTAssertEqual(total, 10) // only quiz_001 counts
    }

    func testFourQuizzes() {
        let quizzes = [
            QuizItem(id: "quiz_001", completedOn: "2025-08-01", score: 15, maxScore: 15, expiresOn: "2025-11-01"),
            QuizItem(id: "quiz_002", completedOn: "2025-06-15", score: 12, maxScore: 15, expiresOn: "2025-09-15"),
            QuizItem(id: "quiz_004", completedOn: "2025-07-20", score: 12, maxScore: 15, expiresOn: "2025-10-20"),
            QuizItem(id: "quiz_003", completedOn: "2025-05-01", score: 9, maxScore: 15, expiresOn: "2025-08-01") // expired
        ]
        let total = calculateTotalValidQuizPoints(from: quizzes, currentDate: fixedNow)
        XCTAssertEqual(total, 39) // 15 + 12 + 12
    }

    func testFiveQuizzes() {
        let quizzes = [
            QuizItem(id: "quiz_001", completedOn: "2025-08-10", score: 15, maxScore: 15, expiresOn: "2025-11-10"),
            QuizItem(id: "quiz_002", completedOn: "2025-07-01", score: 15, maxScore: 15, expiresOn: "2025-10-01"),
            QuizItem(id: "quiz_003", completedOn: "2025-06-15", score: 9, maxScore: 15, expiresOn: "2025-09-15"),
            QuizItem(id: "quiz_006", completedOn: "2025-07-20", score: 12, maxScore: 15, expiresOn: "2025-10-20"),
            QuizItem(id: "quiz_005", completedOn: "2025-04-01", score: 15, maxScore: 15, expiresOn: "2025-07-01") // expired
        ]
        let total = calculateTotalValidQuizPoints(from: quizzes, currentDate: fixedNow)
        XCTAssertEqual(total, 51) // sum of non-expired quizzes: 15 + 15 + 9 + 12
    }

    func testAllExpiredQuizzes() {
        let quizzes = [
            QuizItem(id: "quiz_001", completedOn: "2025-04-01", score: 15, maxScore: 15, expiresOn: "2025-07-01"),
            QuizItem(id: "quiz_002", completedOn: "2025-03-15", score: 12, maxScore: 15, expiresOn: "2025-06-15")
        ]
        let total = calculateTotalValidQuizPoints(from: quizzes, currentDate: fixedNow)
        XCTAssertEqual(total, 0)
    }

    func testNoQuizzes() {
        let quizzes: [QuizItem] = []
        let total = calculateTotalValidQuizPoints(from: quizzes, currentDate: fixedNow)
        XCTAssertEqual(total, 0)
    }
}
