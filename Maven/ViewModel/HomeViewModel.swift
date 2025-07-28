//
//  HomeViewModel.swift
//  Maven
//
//  Created by Isabella Sulisufi on 09/05/2025.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var creditMixScore: Int = 0
    @Published var totalScore: Int = 0
    @Published var behaviour: Behaviour?
    @Published var creditCard: CreditCard?
    @Published var bnplUsage: BNPLUsageProvider?
    @Published var income: Income?
    @Published var knowledge: Knowledge?

    init() {
        loadAndProcessJSON()
    }

    func processUserData(from jsonData: Data) {
        let decoder = JSONDecoder()

        do {
            let userData = try decoder.decode(UserData.self, from: jsonData)
            let paymentHistory = userData.behaviour.paymentHistory
            let creditCard = userData.behaviour.creditCards?.first
            let loan = userData.behaviour.loans?.first
            let bnplProvider = userData.behaviour.bnpl?.providers.first
            let income = userData.behaviour.income
            let savings = userData.behaviour.accounts?.savingsAccounts ?? []
            let behaviour = userData.behaviour
            let knowledge = userData.knowledge

            let paymentHistoryScore = calculatePaymentHistory(paymentHistory: paymentHistory)
            let creditUtilisationScore = calculateCreditUtilisation(creditCard: creditCard)
            let bnplUsageScore = calculateBNPLUsageInLast30Days(bnplUsage: bnplProvider)
            let savingsPresenceScore = calculateSavingsPresence(savingsAccounts: savings)
            let debtToIncomeScore = calculateDebtToIncomeRatio(data: behaviour)
            let creditMixScore = calculateCreditMix(creditCard: creditCard, loan: loan, bnpl: bnplProvider)
            let creditLimitMovementScore = calculateCreditLimitMovement(creditCard: creditCard)
            let loanRepaymentScore = calculateLoanRepaymentConsistency(loan: loan)
            let incomeStabilityScore = calculateIncomeStability(income: income)

            let userScenarioScore = calculateTotalUserScenarioPoints(from: knowledge.userScenarios)
            let quizScore = calculateTotalValidQuizPoints(from: knowledge.quiz.quizzes)
            let improveVideo = calculateTotalImproveVideoPoints(from: knowledge.improveVideos)

            let totalScore = paymentHistoryScore +
                             creditUtilisationScore +
                             bnplUsageScore +
                             savingsPresenceScore +
                             debtToIncomeScore +
                             creditMixScore +
                             creditLimitMovementScore +
                             loanRepaymentScore +
                             incomeStabilityScore +
                             userScenarioScore +
                             quizScore +
                             improveVideo

            DispatchQueue.main.async {
                self.creditMixScore = creditMixScore
                self.totalScore = totalScore
                self.behaviour = behaviour
                self.creditCard = creditCard
                self.bnplUsage = bnplProvider
                self.income = income
                self.knowledge = knowledge
            }

            print("Payment History Score:", paymentHistoryScore, "out of 200")
            print("Credit Utilisation Score:", creditUtilisationScore, "out of 135")
            print("BNPL Usage Score:", bnplUsageScore, "out of 80")
            print("Savings Presence Score:", savingsPresenceScore, "out of 75")
            print("Debt-to-Income Score:", debtToIncomeScore, "out of 50")
            print("Credit Mix Score:", creditMixScore, "out of 45")
            print("Credit Limit Movement Score:", creditLimitMovementScore, "out of 45")
            print("Loan Repayment Score:", loanRepaymentScore, "out of 35")
            print("Income Stability Score:", incomeStabilityScore, "out of 35")
            print("***************Knowledge***************")
            print("User Scenario Score:", userScenarioScore, "out of 60")
            print("Quiz Score:", quizScore, "out of 120")
            print("Improve Video Score:", improveVideo, "out of 120")

            print("Total Score:", totalScore)

        } catch {
            print("Error decoding JSON:", error)
        }
    }

    // explorerEx
    // builderEx
    // strategistEx
    // championEx

    func loadAndProcessJSON() {
        if let url = Bundle.main.url(forResource: "championEx", withExtension: "json") {
            do {
                let jsonData = try Data(contentsOf: url)
                processUserData(from: jsonData)
            } catch {
                print("Error reading JSON file:", error)
            }
        } else {
            print("JSON file not found in bundle.")
        }
    }
}
