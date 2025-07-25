//
//  ImproveHomeSnapshotTest.swift
//  Maven
//
//  Created by Isabella Sulisufi on 15/07/2025.
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import Maven

final class ImproveHomeSnapshotTest: XCTestCase {

    func makeView() -> UIViewController {

        let view = ImproveHomeView()
        let viewController = UIHostingController(rootView: view)
        viewController.view.frame = CGRect(x: 0, y: 0, width: 375, height: 1200)
        return viewController
    }

    func testImproveHomeView() {
        let viewController = makeView()
        assertSnapshot(of: viewController, as: .image)
    }
}
