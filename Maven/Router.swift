//
//  Router.swift
//  Maven
//
//  Created by Isabella Sulisufi on 14/07/2025.
//

import SwiftUI

final class Router: ObservableObject {

    public enum Destination: Codable, Hashable {
        
        //Pages
        case financialCenterView
        case financialHabitsView
        case infoView
        case improveHomeView
        case userScenarioView
        case quizView
        
        // User Scenario
        case ellieView
        case jakeView
        case marcusView
        case mariaView
        case mofizView
        case sarahView
    }

    @Published var navPath = NavigationPath()

    func navigate(to destination: Destination) {
        navPath.append(destination)
    }

    func navigateBack() {
        navPath.removeLast()
    }

    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}
