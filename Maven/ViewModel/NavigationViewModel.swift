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
    
    func navigateToImproveHomeView() {
        router.navigate(to: .improveHomeView)
    }
    
    // MARK: - User Scenarios
    func navigateToUserScenarioHomeView() {
        router.navigate(to: .userScenarioView)
    }
    
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
    
    // MARK: - Quiz
    func navigateToQuizHomeView() {
        router.navigate(to: .quizHomeView)
    }
    
    
    func navigateToQuizIntroView(quizID: String) {
        router.navigate(to: .quizIntroView(quizID: quizID))
    }

    func navigateToQuizQuestionView(quizID: String) {
        if let quiz = QuizData.allQuizzes[quizID] {
            router.navigate(to: .quizQuestionView(quiz: quiz))
        } else {
            print("⚠️ Quiz not found for ID: \(quizID)")
        }
    }
}
