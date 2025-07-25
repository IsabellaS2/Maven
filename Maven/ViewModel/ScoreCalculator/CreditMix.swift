//
//  CreditMix.swift
//  Maven
//
//  Created by Isabella Sulisufi on 08/07/2025.
//

func calculateCreditMix(creditCard: CreditCard?, loan: Loan?, bnpl: BNPLUsageProvider?) -> Int {
    let hasCreditCard = creditCard != nil
    let hasLoan = loan != nil
    let hasBNPL = bnpl != nil

    if hasLoan && hasCreditCard {
        return 45
    } else if hasLoan || hasCreditCard {
        return 20
    } else if hasBNPL {
        return 15
    } else {
        return 10
    }
}
