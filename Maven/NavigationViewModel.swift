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
    
    // MARK: - User Scenarios
    func navigateToEllieView() {
        router.navigate(to: .ellieView)
    }
    
    func navigateToJakeView() {
        router.navigate(to: .jakeView)
    }
    
    func navigateToMarcusView() {
        router.navigate(to: .marcusView)
    }
    
    func navigateToMariaView() {
        router.navigate(to: .mariaView)
    }
    
    func navigateToMofizView() {
        router.navigate(to: .mofizView)
    }
    
    func navigateToSarahView() {
        router.navigate(to: .sarahView)
    }
}
