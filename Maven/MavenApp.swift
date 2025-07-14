//
//  MavenApp.swift
//  Maven
//
//  Created by Isabella Sulisufi on 08/05/2025.
//

import SwiftUI

//@main
//struct MavenApp: App {
//    
//    let viewModel = HomeViewModel()
//    var body: some Scene {
//        WindowGroup {
//            HomeView(vm: viewModel)
//        }
//    }
//}

@main
struct MavenApp: App {
    @StateObject var router = Router()

    var body: some Scene {
        let viewModel = HomeViewModel()
        let navViewModel = NavigationViewModel(router: router)

        WindowGroup {
            NavigationStack(path: $router.navPath) {
                HomeView(vm: viewModel, nav: navViewModel)
                    .navigationDestination(for: Router.Destination.self) { destination in
                        switch destination {
                            
                        case .financialCenterView:
                            FinancialCenterView()
                            
                        case .financialHabitsView:
                            FinancialHabitsView()
                            
                        case .infoView:
                            MavenInfoView()
                        }
                    }
            }
            .environmentObject(router)
        }
    }
}
