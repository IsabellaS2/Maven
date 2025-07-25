//
//  CreditUtilisation.swift
//  Maven
//
//  Created by Isabella Sulisufi on 07/07/2025.
//

func calculateCreditUtilisation(creditCard: CreditCard?) -> Int {
    guard let creditCard = creditCard else {
        return 35
    }

    let balance = creditCard.balance
    let limit = creditCard.limit

    guard limit > 0 else {
        return 35
    }

    let utilisation = balance / limit

    switch utilisation {
    case ..<0.3:
        return 135
    case 0.3...0.49:
        return 80
    case 0.5...0.74:
        return 40
    default:
        return 0
    }
}
