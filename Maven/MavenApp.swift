//
//  MavenApp.swift
//  Maven
//
//  Created by Isabella Sulisufi on 08/05/2025.
//

import SwiftUI

@main
struct MavenApp: App {
    @StateObject var router = Router()

    var body: some Scene {
        let viewModel = HomeViewModel()
        let navViewModel = NavigationViewModel(router: router)
        let userScenarios: UserScenarios? = loadScenarios()

        WindowGroup {
            NavigationStack(path: $router.navPath) {
                HomeView(vm: viewModel, nav: navViewModel)
                    .navigationDestination(for: Router.Destination.self) { destination in
                        switch destination {
                            
                        case .financialCenterView:
                            FinancialCenterView(nav: navViewModel)
                            
                        case .financialHabitsView:
                            FinancialHabitsView()
                            
                        case .infoView:
                            MavenInfoView()
                            
                        case .ellieView:
                            EllieView(ellie: userScenarios!.elliesCreditCardStruggles)

                        case .jakeView:
                            JakeView(jake: userScenarios!.jakesDebtManagementStruggles)
                        
                        case .marcusView:
                            MarcusView(marcus: userScenarios!.marcussMortgageMisunderstanding)
                            
                        case .mariaView:
                            MariaView(maria: userScenarios!.mariasBnplTrouble)
                        
                        case .mofizView:
                            MofizView(mofiz: userScenarios!.mofizsCarLoanOversight)
                            
                        case .sarahView:
                            SarahView(sarah: userScenarios!.sarahsCreditCardBalanceTransferMisstep)
                            
                        }
                    }
            }
            .environmentObject(router)
        }
    }
}
