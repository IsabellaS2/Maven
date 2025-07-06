//
//  LoanRepayment.swift
//  Maven
//
//  Created by Isabella Sulisufi on 05/07/2025.
//

func calculateLoanRepaymentConsistency(loan: Loan?) -> Int {
    guard let consistency = loan?.repaymentConsistency, !consistency.isEmpty else {
        return 15
    }
    
    switch consistency {
    case "always_consistent":
        return 35
    case "mostly_consistent":
        return 20
    case "irregular":
        return 0
    default:
        return 0
    }
}

