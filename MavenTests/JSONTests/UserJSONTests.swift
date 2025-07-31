//
//  UserJSONTests.swift
//  Maven
//
//  Created by Isabella Sulisufi on 28/07/2025.
//

import XCTest
@testable import Maven

class UserDecodingTests: XCTestCase {

    func testBuilderJSON() {
        let testBundle = Bundle(for: type(of: self))

        guard let userData: UserData = loadJSON(fileName: "builderEx", as: UserData.self, in: testBundle) else {
            XCTFail("Failed to load builderEx.json")
            return
        }

        // MARK: - User
        XCTAssertEqual(userData.user.id, "builder_001")
        XCTAssertFalse(userData.user.id.isEmpty)

        // MARK: - Income
        let income = userData.behaviour.income
        XCTAssertEqual(income?.source, "Part-time Employment")
        XCTAssertEqual(income?.averageAmount, 1100.0)

        // MARK: - Savings
        let savings = userData.behaviour.accounts?.savingsAccounts
        XCTAssertEqual(savings?.count, 1)
        XCTAssertEqual(savings?.first?.balance.current, 250.0)

        // MARK: - Credit Card
        let card = userData.behaviour.creditCards?.first
        XCTAssertEqual(card?.limit, 1200)
        XCTAssertEqual(card?.balance, 420.0)
        XCTAssertNil(card?.lastLimitIncrease)
        XCTAssertNil(card?.lastLimitDecrease)

        // MARK: - BNPL
        let bnpl = userData.behaviour.bnpl
        XCTAssertTrue(bnpl?.active ?? false)
        XCTAssertEqual(bnpl?.providers.first?.transactionsLast30Days, 3)
        XCTAssertEqual(bnpl?.providers.first?.totalSpent, 95.0)

        // MARK: - Payment History
        let paymentHistory = userData.behaviour.paymentHistory
        XCTAssertEqual(paymentHistory?.onTimePaymentsLast6Months, 6)
        XCTAssertEqual(paymentHistory?.missedPaymentsLast6Months, 0)

        // MARK: - Transactions
        let transactions = userData.behaviour.transactions
        XCTAssertEqual(transactions?.count, 3)
        XCTAssertEqual(transactions?.first?.description, "Wages - Retail Shift")

        // MARK: - Knowledge Scores
        let quiz = userData.knowledge.quiz.quizzes
        XCTAssertEqual(quiz.count, 2)
        XCTAssertEqual(quiz.first?.score, 15)

        let scenarios = userData.knowledge.userScenarios.scenarios
        XCTAssertEqual(scenarios.first?.points, 10)

        let videos = userData.knowledge.improveVideos.videos
        XCTAssertEqual(videos.first?.completionAmount, 0.9)
    }
    
    func testExplorerJSON() {
        let testBundle = Bundle(for: type(of: self))

        guard let userData: UserData = loadJSON(fileName: "explorerEx", as: UserData.self, in: testBundle) else {
            XCTFail("Failed to load explorerEx.json")
            return
        }

        // MARK: - User
        XCTAssertEqual(userData.user.id, "explorer_002")
        XCTAssertFalse(userData.user.id.isEmpty)

        // MARK: - Income
        let income = userData.behaviour.income
        XCTAssertEqual(income?.source, "")
        XCTAssertEqual(income?.averageAmount, 0)
        XCTAssertFalse(income?.isStable ?? true)

        // MARK: - Savings
        let savings = userData.behaviour.accounts?.savingsAccounts
        XCTAssertEqual(savings?.count, 0)

        // MARK: - Credit Card
        let card = userData.behaviour.creditCards
        XCTAssertTrue(card?.isEmpty ?? false)

        // MARK: - BNPL
        let bnpl = userData.behaviour.bnpl
        XCTAssertTrue(bnpl?.active ?? false)
        XCTAssertEqual(bnpl?.providers.first?.transactionsLast30Days, 5)
        XCTAssertEqual(bnpl?.providers.first?.totalSpent, 149.99)

        // MARK: - Payment History
        let paymentHistory = userData.behaviour.paymentHistory
        XCTAssertEqual(paymentHistory?.onTimePaymentsLast6Months, 2)
        XCTAssertEqual(paymentHistory?.missedPaymentsLast6Months, 0)

        // MARK: - Transactions
        let transactions = userData.behaviour.transactions
        XCTAssertEqual(transactions?.count, 0)

        // MARK: - Knowledge Scores
        let quiz = userData.knowledge.quiz.quizzes
        XCTAssertTrue(quiz.isEmpty)

        let scenarios = userData.knowledge.userScenarios.scenarios
        XCTAssertEqual(scenarios.count, 1)
        XCTAssertEqual(scenarios.first?.points, 10)

        let videos = userData.knowledge.improveVideos.videos
        XCTAssertEqual(videos.count, 1)
        XCTAssertEqual(videos.first?.completionAmount, 0.9)
    }
    
    func testStrategistJSON() {
        let testBundle = Bundle(for: type(of: self))

        guard let userData: UserData = loadJSON(fileName: "strategistEx", as: UserData.self, in: testBundle) else {
            XCTFail("Failed to load strategistEx.json")
            return
        }

        // MARK: - User
        XCTAssertEqual(userData.user.id, "strategist_001")
        XCTAssertFalse(userData.user.id.isEmpty)

        // MARK: - Income
        let income = userData.behaviour.income
        XCTAssertEqual(income?.source, "Full-time Employment")
        XCTAssertEqual(income?.averageAmount, 3500.0)
        XCTAssertTrue(income?.isStable ?? false)

        // MARK: - Savings
        let savings = userData.behaviour.accounts?.savingsAccounts
        XCTAssertEqual(savings?.count, 1)
        XCTAssertEqual(savings?.first?.balance.current, 750.0)

        // MARK: - Credit Card
        let card = userData.behaviour.creditCards?.first
        XCTAssertEqual(card?.limit, 4000)
        XCTAssertEqual(card?.balance, 1000.0)
        XCTAssertEqual(card?.lastLimitIncrease, "2025-05-20")
        XCTAssertNil(card?.lastLimitDecrease)

        // MARK: - Loan
        let loan = userData.behaviour.loans?.first
        XCTAssertEqual(loan?.provider, "NatWest")
        XCTAssertEqual(loan?.amount, 5000)
        XCTAssertEqual(loan?.monthlyRepayment, 350)
        XCTAssertEqual(loan?.repaymentConsistency, "always_consistent")

        // MARK: - BNPL
        let bnpl = userData.behaviour.bnpl
        XCTAssertTrue(bnpl?.active ?? false)
        XCTAssertEqual(bnpl?.providers.first?.transactionsLast30Days, 1)
        XCTAssertEqual(bnpl?.providers.first?.totalSpent, 49.99)

        // MARK: - Payment History
        let paymentHistory = userData.behaviour.paymentHistory
        XCTAssertEqual(paymentHistory?.onTimePaymentsLast6Months, 6)
        XCTAssertEqual(paymentHistory?.missedPaymentsLast6Months, 0)

        // MARK: - Knowledge Scores
        let quizzes = userData.knowledge.quiz.quizzes
        XCTAssertEqual(quizzes.count, 2)
        XCTAssertEqual(quizzes.first?.score, 15)

        let scenarios = userData.knowledge.userScenarios.scenarios
        XCTAssertEqual(scenarios.count, 3)
        XCTAssertEqual(scenarios.first?.points, 10)

        let videos = userData.knowledge.improveVideos.videos
        XCTAssertEqual(videos.count, 3)
        XCTAssertEqual(videos[0].completionAmount, 0.9)
        XCTAssertEqual(videos[2].points, 6)
    }
    
    func testChampionJSON() {
        let testBundle = Bundle(for: type(of: self))

        guard let userData: UserData = loadJSON(fileName: "championEx", as: UserData.self, in: testBundle) else {
            XCTFail("Failed to load championEx.json")
            return
        }

        // MARK: - User
        XCTAssertEqual(userData.user.id, "champion_001")
        XCTAssertFalse(userData.user.id.isEmpty)

        // MARK: - Income
        let income = userData.behaviour.income
        XCTAssertEqual(income?.source, "Full-time Employment")
        XCTAssertEqual(income?.averageAmount, 4000.0)
        XCTAssertTrue(income?.isStable ?? false)

        // MARK: - Savings
        let savings = userData.behaviour.accounts?.savingsAccounts
        XCTAssertEqual(savings?.count, 1)
        XCTAssertEqual(savings?.first?.balance.current, 1200.0)

        // MARK: - Credit Card
        let card = userData.behaviour.creditCards?.first
        XCTAssertEqual(card?.limit, 5000)
        XCTAssertEqual(card?.balance, 800)
        XCTAssertEqual(card?.lastLimitIncrease, "2025-05-20")

        // MARK: - Loan
        let loan = userData.behaviour.loans?.first
        XCTAssertEqual(loan?.provider, "NatWest")
        XCTAssertEqual(loan?.monthlyRepayment, 350)
        XCTAssertEqual(loan?.balanceRemaining, 3000)
        XCTAssertEqual(loan?.repaymentConsistency, "always_consistent")

        // MARK: - BNPL
        let bnpl = userData.behaviour.bnpl
        XCTAssertTrue(bnpl?.active ?? false)
        XCTAssertEqual(bnpl?.providers.first?.transactionsLast30Days, 0)

        // MARK: - Payment History
        let paymentHistory = userData.behaviour.paymentHistory
        XCTAssertEqual(paymentHistory?.onTimePaymentsLast6Months, 6)
        XCTAssertEqual(paymentHistory?.missedPaymentsLast6Months, 0)

        // MARK: - Knowledge Scores

        let quizzes = userData.knowledge.quiz.quizzes
        XCTAssertEqual(quizzes.count, 8)
        XCTAssertEqual(quizzes.first?.score, 15)

        let scenarios = userData.knowledge.userScenarios.scenarios
        XCTAssertEqual(scenarios.count, 5)
        XCTAssertEqual(scenarios.first?.points, 10)

        let videos = userData.knowledge.improveVideos.videos
        XCTAssertEqual(videos.count, 12)
        XCTAssertEqual(videos.first?.completionAmount, 0.9)
        XCTAssertEqual(videos.last?.points, 6)
    }
}
