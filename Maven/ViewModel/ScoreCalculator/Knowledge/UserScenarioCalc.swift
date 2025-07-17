//
//  UserScenarioCalc.swift
//  Maven
//
//  Created by Isabella Sulisufi on 14/07/2025.

import Foundation

func calculateTotalUserScenarioPoints(from summary: UserScenariosSummary, now: Date = Date()) -> Int {
    print("Now is \(now)")
    return summary.scenarios.reduce(0) { total, scenario in
        guard
            let expiresDate = parseDate(scenario.expiresOn),
            let completedDate = parseDate(scenario.completedOn)
        else {
            print("❌ Failed to parse dates for scenario id: \(scenario.id), completedOn: \(scenario.completedOn), expiresOn: \(scenario.expiresOn)")
            return total
        }
        
        print("Scenario \(scenario.id): completedDate=\(completedDate), expiresDate=\(expiresDate), now=\(now)")
        
        if completedDate <= expiresDate && expiresDate > now {
            print("✅ Adding points \(scenario.points) for scenario \(scenario.id)")
            return total + scenario.points
        } else {
            print("❌ Not adding points for scenario \(scenario.id), expired or invalid date range")
            return total
        }
    }
}

