//
//  PaymentHistory.swift
//  Maven
//
//  Created by Isabella Sulisufi on 08/07/2025.
//

func calculatePaymentHisotry(paymentHistory: PaymentHistory?) -> Int {
    guard let paymentHistory = paymentHistory else {
        return 100
    }
    
    if paymentHistory.onTimePaymentsLast6Months == nil && paymentHistory.missedPaymentsLast6Months == nil {
        return 100
    }
    
    let onTime = paymentHistory.onTimePaymentsLast6Months ?? 0
    let missed = paymentHistory.missedPaymentsLast6Months ?? 0
    
    if missed == 0 && onTime >= 1 {
        return 200
    }
    
    if missed == 1 && onTime > 0 {
        return 120
    }
    
    if (2...3).contains(missed) && onTime > 0 {
        return 80
    }
    
    if missed >= 4 {
        return onTime > 0 ? 30 : 10
    }
    
    return 100
}


