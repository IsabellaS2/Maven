//
//  BNPLUsage.swift
//  Maven
//
//  Created by Isabella Sulisufi on 06/07/2025.
//


func calculateBNPLUsageInLast30Days(bnplUsage: BNPLUsageProvider?) -> Int {
    guard let usage = bnplUsage else {
        return 35
    }
    
    switch usage.transactionsLast30Days {
    case 0...1:
        return 80
    case 2...3:
        return 50
    case 4...:
        return 0
    default:
        return 35
    }
}
