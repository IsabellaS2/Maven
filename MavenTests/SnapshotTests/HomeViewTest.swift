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
    
    func makeView(score: Int) -> UIViewController {
        let viewModel = HomeViewModel()
        viewModel.totalScore = score

        let view = HomeView(vm: viewModel)
        let viewController = UIHostingController(rootView: view)
        viewController.view.frame = CGRect(x: 0, y: 0, width: 375, height: 812)
        return viewController
    }
    
    func testHomeViewSnapshotExplorerLevel() {
        let viewController = makeView(score: 250)
        assertSnapshot(of: viewController, as: .image)
    }
    
    func testHomeViewSnapshotBuilderLevel() {
        let viewController = makeView(score: 520)
        assertSnapshot(of: viewController, as: .image)
    }
    
    func testHomeViewSnapshotStrategistLevel() {
        let viewController = makeView(score: 725)
        assertSnapshot(of: viewController, as: .image)
    }

    
    func testHomeViewSnapshotChampionLevel() {
        let viewController = makeView(score: 895)
        assertSnapshot(of: viewController, as: .image)
    }
    
}
