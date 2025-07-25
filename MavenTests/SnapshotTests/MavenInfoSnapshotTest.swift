//
//  MavenInfoSnapshotTest.swift
//  Maven
//
//  Created by Isabella Sulisufi on 15/07/2025.
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import Maven

final class MavenInfoSnapshotTest: XCTestCase {

    func makeView() -> UIViewController {

        let view = MavenInfoView()
        let viewController = UIHostingController(rootView: view)
        viewController.view.frame = CGRect(x: 0, y: 0, width: 375, height: 1100)
        return viewController
    }

    func testMavenInfoView() {
        let viewController = makeView()
        assertSnapshot(of: viewController, as: .image)
    }
}
