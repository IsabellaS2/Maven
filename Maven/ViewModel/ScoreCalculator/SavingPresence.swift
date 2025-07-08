//
//  SavingPresence.swift
//  Maven
//
//  Created by Isabella Sulisufi on 06/07/2025.
//

func calculateSavingsPresence(savingsAccounts: [SavingsAccount]) -> Int {
    guard !savingsAccounts.isEmpty else { return 25 }

    let total = savingsAccounts.reduce(0.0) { $0 + $1.balance.current }

    if total > 500 {
        return 75
    } else if total >= 100 {
        return 40
    }
    return 10
}
