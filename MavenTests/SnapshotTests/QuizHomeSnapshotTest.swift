//
//  QuizHomeSnapshotTest.swift
//  Maven
//
//  Created by Isabella Sulisufi on 15/07/2025.
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import Maven

final class QuizHomeSnapshotTest: XCTestCase {

    func makeView() -> UIViewController {
        let router = Router()
        let navViewModel = NavigationViewModel(router: router)

        let view = QuizHomeView(nav: navViewModel)
        let viewController = UIHostingController(rootView: view)
        viewController.view.frame = CGRect(x: 0, y: 0, width: 375, height: 1300)
        return viewController
    }

    func testQuizHomeView() {
        let viewController = makeView()
        assertSnapshot(of: viewController, as: .image)
    }
}
