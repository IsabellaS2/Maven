//
//  HomeViewTest.swift
//  Maven
//
//  Created by Isabella Sulisufi on 08/07/2025.
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import Maven

final class HomeViewSnapshotTests: XCTestCase {
    
    func testHomeViewSnapshotExplorerLevel() {
        let view = HomeView(score: 250)

        // Set the view size explicitly
        let viewController = UIHostingController(rootView: view)
        viewController.view.frame = CGRect(x: 0, y: 0, width: 375, height: 812)

        assertSnapshot(of: viewController, as: .image)
    }
    
    func testHomeViewSnapshotBuilderLevel() {
        let view = HomeView(score: 520)

        // Set the view size explicitly
        let viewController = UIHostingController(rootView: view)
        viewController.view.frame = CGRect(x: 0, y: 0, width: 375, height: 812)

        assertSnapshot(of: viewController, as: .image)
    }
    
    func testHomeViewSnapshotStrategistLevel() {
        let view = HomeView(score: 725)

        // Set the view size explicitly
        let viewController = UIHostingController(rootView: view)
        viewController.view.frame = CGRect(x: 0, y: 0, width: 375, height: 812)

        assertSnapshot(of: viewController, as: .image)
    }

    
    func testHomeViewSnapshotChampionLevel() {
        let view = HomeView(score: 895)

        // Set the view size explicitly
        let viewController = UIHostingController(rootView: view)
        viewController.view.frame = CGRect(x: 0, y: 0, width: 375, height: 812)

        assertSnapshot(of: viewController, as: .image)
    }
    
}
