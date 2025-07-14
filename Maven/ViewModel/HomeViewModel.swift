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
        
//        payment history
//        credit utilisation
//        bnpl usage
//        saving presence
//        debt to income ratio
//        credit mix
//        credit limit movement
//        loan repayment
//        income consistency

        do {

            let userData = try decoder.decode(UserData.self, from: jsonData)
            let paymentHistory = userData.behaviour.paymentHistory
            let creditCard = userData.behaviour.creditCards?.first
            let loan = userData.behaviour.loans?.first
            let bnplProvider = userData.behaviour.bnpl?.providers.first
            let income = userData.behaviour.income
            let savings = userData.behaviour.accounts?.savingsAccounts ?? []
            let behaviour = userData.behaviour

            let paymentHistoryScore = calculatePaymentHistory(paymentHistory: paymentHistory)
            let creditUtilisationScore = calculateCreditUtilisation(cc: creditCard)
            let bnplUsageScore = calculateBNPLUsageInLast30Days(bnplUsage: bnplProvider)
            let savingsPresenceScore = calculateSavingsPresence(savingsAccounts: savings)
            let debtToIncomeScore = calculateDebtToIncomeRatio(data: behaviour)
            let creditMixScore = calculateCreditMix(cc: creditCard, loan: loan, bnpl: bnplProvider)
            let creditLimitMovementScore = calculateCreditLimitMovement(cc: creditCard)
            let loanRepaymentScore = calculateLoanRepaymentConsistency(loan: loan)
            let incomeStabilityScore = calculateIncomeStability(income: income)

            let totalScore = paymentHistoryScore +
                             creditUtilisationScore +
                             bnplUsageScore +
                             savingsPresenceScore +
                             debtToIncomeScore +
                             creditMixScore +
                             creditLimitMovementScore +
                             loanRepaymentScore +
                             incomeStabilityScore

            DispatchQueue.main.async {
                self.creditMixScore = creditMixScore
                self.totalScore = totalScore
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
            print("Total Score:", totalScore)

        } catch {
            print("Error decoding JSON:", error)
        }
    }

    func loadAndProcessJSON() {
        if let url = Bundle.main.url(forResource: "strategistEx", withExtension: "json") {
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
