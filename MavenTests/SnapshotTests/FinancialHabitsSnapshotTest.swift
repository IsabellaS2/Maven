//
//  FinancialHabitsSnapshotTest.swift
//  Maven
//
//  Created by Isabella Sulisufi on 15/07/2025.
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import Maven

final class FinancialHabitsSnapshotTest: XCTestCase {

    func makeView() -> UIViewController {
        let viewModel = HomeViewModel()
        let router = Router()
        let navViewModel = NavigationViewModel(router: router)

        let mockBehaviour = Behaviour(
            accounts: Accounts(savingsAccounts: []),
            income: nil,
            creditCards: nil,
            loans: nil,
            bnpl: nil,
            transactions: nil,
            categories: nil,
            debtToIncomeRatio: nil,
            lastPaidDate: nil,
            paymentHistory: nil
        )

        let view = FinancialHabitsView(behaviour: mockBehaviour, nav: navViewModel)
        let viewController = UIHostingController(rootView: view)
        viewController.view.frame = CGRect(x: 0, y: 0, width: 375, height: 1200)
        return viewController
    }

    func testFinancialHabitsView() {
        let viewController = makeView()
        assertSnapshot(of: viewController, as: .image)
    }
}
