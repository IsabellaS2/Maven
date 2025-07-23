//
//  LoadJSONFunction.swift
//  Maven
//
//  Created by Isabella Sulisufi on 27/05/2025.
//

import SwiftUI

func loadJSON<T: Decodable>(fileName: String, as type: T.Type) -> T? {
    guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
        print("🚫 Could not find \(fileName).json in bundle.")
        return nil
    }
    print("📁 \(fileName).json found at: \(url)")

    do {
        let data = try Data(contentsOf: url)
        let decoded = try JSONDecoder().decode(T.self, from: data)
        return decoded
    } catch {
        print("❌ JSON decoding failed for \(fileName).json with error: \(error)")
        return nil
    }
}
