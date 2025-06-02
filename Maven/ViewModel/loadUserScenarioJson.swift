//
//  loadUSJson.swift
//  Maven
//
//  Created by Isabella Sulisufi on 27/05/2025.
//

import SwiftUI

func loadScenarios() -> UserScenarios? {
    guard let url = Bundle.main.url(forResource: "scenarios", withExtension: "json") else {
        print("🚫 Could not find scenarios.json in bundle.")
        return nil
    }
    print("📁 scenario.json found at: \(url)")

    do {
        let data = try Data(contentsOf: url)
        let scenarios = try JSONDecoder().decode(UserScenarios.self, from: data)
        return scenarios
    } catch {
        print("❌ JSON decoding failed with error: \(error)")
        return nil
    }
}
