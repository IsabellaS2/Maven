//
//  CreditLimitMovement.swift
//  Maven
//
//  Created by Isabella Sulisufi on 07/07/2025.
//

import Foundation

func calculateCreditLimitMovement(cc: CreditCard?, today: Date = Date()) -> Int {

    guard let cc = cc else {
        return 20
    }
    
    let todayDate = Date()
    let increaseDate = parseDate(cc.lastLimitIncrease)
    let decreaseDate = parseDate(cc.lastLimitDecrease)
    
    if decreaseDate != nil {
        return 0
    }
    
    if let increaseDate = increaseDate {
        let gap = Calendar.current.dateComponents([.day], from: increaseDate, to: todayDate).day ?? Int.max
        if gap <= 30 {
            return 45
        }
    }

    return 10
}
