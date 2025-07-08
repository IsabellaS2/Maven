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

    init() {
        loadAndProcessJSON()
    }

    func processUserData(from jsonData: Data) {
        let decoder = JSONDecoder()

        do {
            let userData = try decoder.decode(UserData.self, from: jsonData)
            let creditCard = userData.behaviour.creditCards?.first
            let loan = userData.behaviour.loans?.first
            let bnplProvider = userData.behaviour.bnpl?.providers.first
            let income = userData.behaviour.income
            let savings = userData.behaviour.accounts?.savingsAccounts ?? []
            let behaviour = userData.behaviour

            let creditMixScore = calculateCreditMix(cc: creditCard, loan: loan, bnpl: bnplProvider)
            let creditLimitMovementScore = calculateCreditLimitMovement(cc: creditCard)
            let bnplUsageScore = calculateBNPLUsageInLast30Days(bnplUsage: bnplProvider)
            let loanRepaymentScore = calculateLoanRepaymentConsistency(loan: loan)
            let incomeStabilityScore = calculateIncomeStability(income: income)
            let savingsPresenceScore = calculateSavingsPresence(savings: savings)
            let debtToIncomeScore = calculateDebtToIncomeRatio(data: behaviour)

            let totalScore = creditMixScore +
                             creditLimitMovementScore +
                             bnplUsageScore +
                             loanRepaymentScore +
                             incomeStabilityScore +
                             savingsPresenceScore +
                             debtToIncomeScore

            DispatchQueue.main.async {
                self.creditMixScore = creditMixScore
                self.totalScore = totalScore
            }

            print("Credit Mix Score:", creditMixScore)
            print("Credit Limit Movement Score:", creditLimitMovementScore)
            print("BNPL Usage Score:", bnplUsageScore)
            print("Loan Repayment Score:", loanRepaymentScore)
            print("Income Stability Score:", incomeStabilityScore)
            print("Savings Presence Score:", savingsPresenceScore)
            print("Debt-to-Income Score:", debtToIncomeScore)
            print("Total Score:", totalScore)

        } catch {
            print("Error decoding JSON:", error)
        }
    }

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
