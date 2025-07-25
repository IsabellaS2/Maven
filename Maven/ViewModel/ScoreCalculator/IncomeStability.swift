//
//  IncomeStability.swift
//  Maven
//
//  Created by Isabella Sulisufi on 04/07/2025.
//

import Foundation

func calculateIncomeStability(income: Income?) -> Int {
    guard let income = income,
          let lastDate = parseDate(income.lastPaidDate),
          let nextDate = parseDate(income.nextExpectedDate) else {
        return 0
    }

    let gap = Calendar.current.dateComponents([.day], from: lastDate, to: nextDate).day ?? 0

    switch income.frequency {
    case "Monthly":
        return scoreForGap(gap, idealRange: 27...33, acceptableRange: 25...38)

    case "Bi-weekly":
        return scoreForGap(gap, idealRange: 13...15, acceptableRange: 12...17)

    case "Weekly":
        return scoreForGap(gap, idealRange: 6...8, acceptableRange: 5...10)

    default:
        return 0
    }
}

private func scoreForGap(_ gap: Int, idealRange: ClosedRange<Int>, acceptableRange: ClosedRange<Int>) -> Int {
    if idealRange.contains(gap) {
        return 35
    } else if acceptableRange.contains(gap) {
        return 20
    }
    return 0
}
