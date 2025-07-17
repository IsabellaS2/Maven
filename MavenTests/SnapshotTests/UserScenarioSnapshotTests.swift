//
//  UserScenarioSnapshotTests.swift
//  Maven
//
//  Created by Isabella Sulisufi on 15/07/2025.
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import Maven

final class UserScenarioSnapshotTests: XCTestCase {

    private func makeView<Content: View>(_ content: Content) -> UIViewController {
        let vc = UIHostingController(rootView: content)
        vc.view.frame = CGRect(x: 0, y: 0, width: 375, height: 1950)
        return vc
    }

    private func loadUserScenariosOrFail() -> UserScenarios {
        guard let userScenarios = loadScenarios() else {
            fatalError("Failed to load user scenarios in test")
        }
        return userScenarios
    }

    func testEllieViewUserScenarioSnapshot() {
        let userScenarios = loadUserScenariosOrFail()
        let view = EllieView(ellie: userScenarios.elliesCreditCardStruggles)
        let vc = makeView(view)
        assertSnapshot(of: vc, as: .image)
    }

    func testJakeViewUserScenarioSnapshot() {
        let userScenarios = loadUserScenariosOrFail()
        let view = JakeView(jake: userScenarios.jakesDebtManagementStruggles)
        let vc = makeView(view)
        assertSnapshot(of: vc, as: .image)
    }

    func testMarcusViewUserScenarioSnapshot() {
        let userScenarios = loadUserScenariosOrFail()
        let view = MarcusView(marcus: userScenarios.marcussMortgageMisunderstanding)
        let vc = makeView(view)
        assertSnapshot(of: vc, as: .image)
    }

    func testMariaViewUserScenarioSnapshot() {
        let userScenarios = loadUserScenariosOrFail()
        let view = MariaView(maria: userScenarios.mariasBnplTrouble)
        let vc = makeView(view)
        assertSnapshot(of: vc, as: .image)
    }

    func testMofizViewUserScenarioSnapshot() {
        let userScenarios = loadUserScenariosOrFail()
        let view = MofizView(mofiz: userScenarios.mofizsCarLoanOversight)
        let vc = makeView(view)
        assertSnapshot(of: vc, as: .image)
    }

    func testSarahViewUserScenarioSnapshot() {
        let userScenarios = loadUserScenariosOrFail()
        let view = SarahView(sarah: userScenarios.sarahsCreditCardBalanceTransferMisstep)
        let vc = makeView(view)
        assertSnapshot(of: vc, as: .image)
    }
}
