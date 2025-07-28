//
//  LatestUpdatesTest.swift
//  Maven
//
//  Created by Isabella Sulisufi on 28/07/2025.
//

@testable import Maven
import XCTest

final class LatestUpdatesTests: XCTestCase {

    let testDate = Calendar.current.date(from: DateComponents(year: 2025, month: 7, day: 28))!

    // MARK: - Credit Card Limit Increase

    func test_returnCCLimitIncrease_withRecentIncrease_returnsCard() {
        let creditCard = CreditCard(
            provider: "Test Bank",
            limit: 400.00,
            balance: 100.00,
            lastLimitIncrease: "2025-07-20",
            lastLimitDecrease: nil
        )
        let card = returnCCLimitIncrease(creditCard: creditCard, today: testDate)
        XCTAssertNotNil(card)
        XCTAssertEqual(card?.icon, "creditcard")
    }

    func test_returnCCLimitIncrease_withOldIncrease_returnsNil() {
        let creditCard = CreditCard(
            provider: "Test Bank",
            limit: 400.00,
            balance: 100.00,
            lastLimitIncrease: "2025-76-20",
            lastLimitDecrease: nil
        )
        XCTAssertNil(returnCCLimitIncrease(creditCard: creditCard, today: testDate))
    }

    // MARK: - BNPL Usage

    func test_returnBNPLPayments_withZeroTransactions_returnsCard() {
        let bnpl = BNPLUsageProvider(
            name: "Test Bank",
            transactionsLast30Days: 0,
            totalSpent: 25.00
        )

        let card = returnBNPLPayments(bnplUsage: bnpl)
        XCTAssertNotNil(card)
        XCTAssertEqual(card?.icon, "creditcard")
    }

    func test_returnBNPLPayments_withActivity_returnsNil() {
        let bnpl = BNPLUsageProvider(
            name: "Test Bank",
            transactionsLast30Days: 4,
            totalSpent: 25.00
        )

        XCTAssertNil(returnBNPLPayments(bnplUsage: bnpl))
    }

    // MARK: - Upcoming Income

    func test_returnUpcomingIncome_withUpcomingDate_returnsCard() {
        let income = Income(
            source: "Full-time Employment",
            frequency: "Monthly",
            averageAmount: 3500.0,
            lastPaidDate: "2025-06-10",
            nextExpectedDate: "2025-08-15",
            isStable: true
        )

        let card = returnUpcomingIncome(income: income, today: testDate)
        XCTAssertNotNil(card)

    }

    func test_returnUpcomingIncome_withFarFuture_returnsNil() {
        let income = Income(
            source: "Full-time Employment",
            frequency: "Monthly",
            averageAmount: 3500.0,
            lastPaidDate: "2025-06-10",
            nextExpectedDate: "2025-10-10",
            isStable: true
        )
        XCTAssertNil(returnUpcomingIncome(income: income, today: testDate))
    }

    // MARK: - Recent Scenarios

    func test_returnRecentScenariosCard_withRecentScenario_returnsCard() {
        let scenarios = [ScenarioItem(id: "s1", completedOn: "2025-07-15", points: 10, expiresOn: "2025-10-01")]
        let card = returnRecentScenariosCard(scenarios: scenarios, today: testDate)
        XCTAssertNotNil(card)
        XCTAssertEqual(card?.icon, "checkmark.circle")
    }

    func test_returnRecentScenariosCard_withOldScenario_returnsNil() {
        let scenarios = [ScenarioItem(id: "s2", completedOn: "2025-05-01", points: 10, expiresOn: "2025-10-01")]
        XCTAssertNil(returnRecentScenariosCard(scenarios: scenarios, today: testDate))
    }

    // MARK: - Recent Videos

    func test_returnRecentVideosCard_withRecentVideos_returnsCard() {
        let videos = [VideoItem(id: "v1", watchedOn: "2025-07-01", points: 6, completionAmount: 1.0)]
        let card = returnRecentVideosCard(videos: videos, today: testDate)
        XCTAssertNotNil(card)
        XCTAssertEqual(card?.icon, "play.circle")
    }

    func test_returnRecentVideosCard_withOldVideos_returnsNil() {
        let videos = [VideoItem(id: "v2", watchedOn: "2025-06-01", points: 6, completionAmount: 1.0)]
        XCTAssertNil(returnRecentVideosCard(videos: videos, today: testDate))
    }

    // MARK: - Recent Quizzes

    func test_returnRecentQuizzesCard_withRecentQuizzes_returnsCard() {
        let quizzes = [QuizItem(id: "q1", completedOn: "2025-07-10", score: 10, maxScore: 15, expiresOn: "2025-10-10")]
        let card = returnRecentQuizzesCard(quizzes: quizzes, today: testDate)
        XCTAssertNotNil(card)
        XCTAssertEqual(card?.icon, "book")
    }

    func test_returnRecentQuizzesCard_withOldQuizzes_returnsNil() {
        let quizzes = [QuizItem(id: "q2", completedOn: "2025-05-01", score: 10, maxScore: 15, expiresOn: "2025-10-10")]
        XCTAssertNil(returnRecentQuizzesCard(quizzes: quizzes, today: testDate))
    }

    // MARK: - Combined Card Generator

    func test_getPositiveLatestCards_returnsAllExpectedCards() {
        let creditCard = CreditCard(
            provider: "Test Bank",
            limit: 400.00,
            balance: 100.00,
            lastLimitIncrease: "2025-07-20",
            lastLimitDecrease: nil
        )

        let bnpl = BNPLUsageProvider(
            name: "Test Bank",
            transactionsLast30Days: 0,
            totalSpent: 25.00
        )

        let income = Income(
            source: "Full-time Employment",
            frequency: "Monthly",
            averageAmount: 3500.0,
            lastPaidDate: "2025-06-10",
            nextExpectedDate: "2025-08-15",
            isStable: true
        )
        let knowledge = Knowledge(
            quiz: Quiz(
                maxTotalPoints: 120,
                quizzes: [
                    QuizItem(id: "q", completedOn: "2025-07-15", score: 12, maxScore: 15, expiresOn: "2025-10-10")
                ]
            ),
            userScenarios: UserScenariosSummary(
                maxTotalPoints: 60,
                scenarios: [
                    ScenarioItem(id: "s", completedOn: "2025-07-10", points: 10, expiresOn: "2025-10-10")
                ]
            ),
            improveVideos: ImproveVideos(
                maxTotalPoints: 120,
                videos: [
                    VideoItem(id: "v", watchedOn: "2025-07-20", points: 6, completionAmount: 1.0)
                ]
            )
        )

        let cards = getPositiveLatestCards(
            creditCard: creditCard,
            bnpl: bnpl,
            knowledge: knowledge,
            income: income,
            today: testDate
        )

        XCTAssertEqual(cards.count, 6)
    }
}
