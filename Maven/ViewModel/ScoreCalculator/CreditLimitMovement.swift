//
//  CreditLimitMovement.swift
//  Maven
//
//  Created by Isabella Sulisufi on 07/07/2025.
//

import Foundation

func calculateCreditLimitMovement(creditCard: CreditCard?, today: Date = Date()) -> Int {
    guard let creditCard = creditCard else {
        return 20
    }

    let increaseDate = parseDate(creditCard.lastLimitIncrease)
    let decreaseDate = parseDate(creditCard.lastLimitDecrease)

    if decreaseDate != nil {
        return 0
    }

    if let increaseDate = increaseDate {
        let gap = Calendar.current.dateComponents([.day], from: increaseDate, to: today).day ?? .max
        if gap <= 30 {
            return 45
        }
    }

    return 10
}
