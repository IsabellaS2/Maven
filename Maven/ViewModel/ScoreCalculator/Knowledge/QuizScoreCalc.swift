//
//  QuizScoreCalc.swift
//  Maven
//
//  Created by Isabella Sulisufi on 15/07/2025.
//

import Foundation

func calculateTotalValidQuizPoints(from quizzes: [QuizItem], currentDate: Date = Date()) -> Int {
    let calendar = Calendar.current

    guard let threeMonthsAgo = calendar.date(byAdding: .month, value: -3, to: currentDate) else {
        return 0
    }

    var total = 0

    for quiz in quizzes {
        guard
            let completedDate = parseDate(quiz.completedOn),
            let expiresDate = parseDate(quiz.expiresOn)
        else {
            print("Failed to parse dates for quiz id: \(quiz.id)")
            continue
        }

        if completedDate >= threeMonthsAgo && completedDate <= currentDate && expiresDate > currentDate {
            total += quiz.score
        } else {
            print("Quiz \(quiz.id) expired or completed too long ago")
        }
    }

    return total
}
