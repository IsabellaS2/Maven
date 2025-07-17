//
//  UserScenarioHomeSnapshotTest.swift
//  Maven
//
//  Created by Isabella Sulisufi on 15/07/2025.
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import Maven

final class UserScenarioHomeSnapshotTest: XCTestCase {
    
    func makeView() -> UIViewController {
        let router = Router()
        let navViewModel = NavigationViewModel(router: router)
        
        let view = UserScenarioHomeView(nav: navViewModel)
        let viewController = UIHostingController(rootView: view)
        viewController.view.frame = CGRect(x: 0, y: 0, width: 375, height: 1500)
        return viewController
    }
    
    func testUserScenarioHomeView() {
        let viewController = makeView()
        assertSnapshot(of: viewController, as: .image)
    }
}
