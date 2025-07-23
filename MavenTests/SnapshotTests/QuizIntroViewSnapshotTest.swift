//
//  QuizIntroViewSnapshotTest.swift
//  Maven
//
//  Created by Isabella Sulisufi on 23/07/2025.
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import Maven

final class QuizIntroViewSnapshotTest: XCTestCase {
    
    func makeView() -> UIViewController {
        QuizData.allQuizzes["1"] = QuizSet(
            title: "Test Quiz",
            category: "Test Category",
            questions: []
        )

        let router = Router()
        let navViewModel = NavigationViewModel(router: router)

        let view = QuizIntroView(quizID: "1", nav: navViewModel)
        let viewController = UIHostingController(rootView: view)
        viewController.view.frame = CGRect(x: 0, y: 0, width: 375, height: 800)
        return viewController
    }

    
    func testQuizIntroView() {
        let viewController = makeView()
        assertSnapshot(of: viewController, as: .image)
    }
}
