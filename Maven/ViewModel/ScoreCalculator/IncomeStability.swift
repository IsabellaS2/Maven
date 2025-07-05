//
//  IncomeStability.swift
//  Maven
//
//  Created by Isabella Sulisufi on 04/07/2025.
//

import Foundation

//if frequency == "Monthly":
//    gap = next_expected_date - last_paid_date
//    if gap is close to 30 ± 3 days for several months:
//        status = "Always consistent"
//    elif some gaps vary more (e.g. between 25–45 days occasionally):
//        status = "Mostly consistent"
//    else:
//        status = "Irregular"

func parseDate(_ dateString: String?) -> Date? {
    guard let dateString = dateString else { return nil }
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter.date(from: dateString)
}


func calculateIncomeStability(income: Income) -> Int {
    guard let lastDate = parseDate(income.lastPaidDate),
              let nextDate = parseDate(income.nextExpectedDate) else {
            return 0
        }

    let gap = Calendar.current.dateComponents([.day], from: lastDate, to: nextDate).day ?? 0
    
    
    switch income.frequency {
    case "Monthly":
        if gap >= 27 && gap <= 33 {
            return 35
        } else if gap >= 25 && gap <= 38 {
            return 20
        } else {
            return 0
        }
    case "Bi-weekly":
        if gap >= 13 && gap <= 15 {
            return 35
        } else if gap >= 12 && gap <= 17 {
            return 20
        } else {
            return 0
        }
    case "Weekly":
        if gap >= 6 && gap <= 8 {
            return 35
        } else if gap >= 5 && gap <= 10 {
            return 20
        } else {
            return 0
        }
        
    default:
        return 0
    }
}
