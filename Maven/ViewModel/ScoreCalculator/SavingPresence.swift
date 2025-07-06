//
//  SavingPresence.swift
//  Maven
//
//  Created by Isabella Sulisufi on 06/07/2025.
//

func calculateSavingsPresence(savings: SavingsAccount?) -> Int {
    guard let savings = savings else { return 25 }

    let amount = savings.balance.current

    if amount > 500 {
        return 75
    } else if amount >= 100 {
        return 40
    } else {
        return 10
    }
}
