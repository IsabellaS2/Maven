//
//  DateUtils.swift
//  Maven
//
//  Created by Isabella Sulisufi on 07/07/2025.
//

import Foundation

func parseDate(_ dateString: String?) -> Date? {
    guard let dateString = dateString else { return nil }
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter.date(from: dateString)
}
