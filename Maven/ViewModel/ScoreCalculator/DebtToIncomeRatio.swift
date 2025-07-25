//
//  DebtToIncomeRatio.swift
//  Maven
//
//  Created by Isabella Sulisufi on 07/07/2025.
//

func calculateDebtToIncomeRatio(data: Behaviour?) -> Int {
    guard let data = data else {
        return 0
    }

    let income = data.income?.averageAmount
    let ratio = data.debtToIncomeRatio

    if income == nil {
        if ratio == nil || ratio == 0 {
            return 25
        }
        return 0
    }

    if let ratio = ratio {
        switch ratio {
        case ..<0.3:
            return 50
        case 0.3...0.5:
            return 30
        default:
            return 10
        }
    }

    return 0
}
