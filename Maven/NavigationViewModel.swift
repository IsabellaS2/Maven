//
//  NavigationViewModel.swift
//  Maven
//
//  Created by Isabella Sulisufi on 14/07/2025.
//

import SwiftUI

class NavigationViewModel: ObservableObject {
    var router: Router

    init(router: Router) {
        self.router = router
    }

    func navigateToFinancialCenter() {
        router.navigate(to: .financialCenterView)
    }
    
    func navigateToFinancialHabits() {
        router.navigate(to: .financialHabitsView)
    }
    
    func navigateToInfoView() {
        router.navigate(to: .infoView)
    }
}
