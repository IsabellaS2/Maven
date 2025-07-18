//
//  LoadFInancialHabitsJson.swift
//  Maven
//
//  Created by Isabella Sulisufi on 17/07/2025.
//

import SwiftUI

func loadFinancialHabits() -> FinancialHabitsData? {
    guard let url = Bundle.main.url(forResource: "financialHabits", withExtension: "json") else {
        print("🚫 Could not find financialHabits.json in bundle.")
        return nil
    }
    do {
        let data = try Data(contentsOf: url)
        let habits = try JSONDecoder().decode(FinancialHabitsData.self, from: data)
        return habits
    } catch {
        print("❌ JSON decoding failed with error: \(error)")
        return nil
    }
}
