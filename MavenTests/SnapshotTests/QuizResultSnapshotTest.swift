//
//  QuizResultSnapshotTest.swift
//  Maven
//
//  Created by Isabella Sulisufi on 23/07/2025.
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import Maven

final class QuizResultSnapshotTest: XCTestCase {
    
    func makeView(score: Int, total: Int) -> UIViewController {
        let router = Router()
        let navViewModel = NavigationViewModel(router: router)
        
        
        let view = QuizResultView(nav: navViewModel, score: score, total: total)
        let viewController = UIHostingController(rootView: view)
        viewController.view.frame = CGRect(x: 0, y: 0, width: 375, height: 800)
        return viewController
    }

    func testQuizQuestionsPerfectScoreView() {
        let viewController = makeView(score: 5, total: 5)
        assertSnapshot(of: viewController, as: .image)
    }
    
    func testQuizQuestionsNiceJobView() {
        let viewController = makeView(score: 4, total: 5)
        assertSnapshot(of: viewController, as: .image)
    }
    
    func testQuizQuestionsFailView() {
        let viewController = makeView(score: 2, total: 5)
        assertSnapshot(of: viewController, as: .image)
    }
}
