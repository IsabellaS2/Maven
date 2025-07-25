//
//  QuizQuestionSnapshotTest.swift
//  Maven
//
//  Created by Isabella Sulisufi on 23/07/2025.
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import Maven

final class QuizQuestionSnapshotTest: XCTestCase {

    func makeView() -> UIViewController {
        let router = Router()
        let navViewModel = NavigationViewModel(router: router)

        let mockQuiz = QuizSet(
            title: "Test Quiz",
            category: "Finance",
            questions: [
                Question(
                    question: "What is APR?",
                    options: ["Annual Percentage Rate", "Average Payment Rate", "Annual Pay Rate"],
                    correctAnswer: "Annual Percentage Rate",
                    explanation: "APR reflects the yearly cost of borrowing, including interest and fees."
                ),
                Question(
                    question: "What is a credit score used for?",
                    options: ["To measure savings", "To assess creditworthiness", "To calculate tax"],
                    correctAnswer: "To assess creditworthiness",
                    explanation: "It’s a number that shows how likely you are to repay debt."
                )
            ]
        )

        let view = QuizQuestionView(nav: navViewModel, quiz: mockQuiz)
        let viewController = UIHostingController(rootView: view)
        viewController.view.frame = CGRect(x: 0, y: 0, width: 375, height: 800)
        return viewController
    }

    func testQuizQuestionsView() {
        let viewController = makeView()
        assertSnapshot(of: viewController, as: .image)
    }
}
