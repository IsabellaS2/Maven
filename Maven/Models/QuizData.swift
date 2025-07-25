//
//  QuizData.swift
//  Maven
//
//  Created by Isabella Sulisufi on 21/07/2025.
//

import Foundation

typealias QuizDatabase = [String: QuizSet]

struct QuizSet: Codable, Hashable {
    let title: String
    let category: String
    let questions: [Question]
}

struct Question: Codable, Hashable, Identifiable {
    var id = UUID()
    let question: String
    let options: [String]
    let correctAnswer: String
    let explanation: String

    private enum CodingKeys: String, CodingKey {
        case question, options, explanation
        case correctAnswer = "correct_answer"

    }
}

struct QuizData {
    static var allQuizzes: QuizDatabase = {
        loadJSON(fileName: "quiz", as: QuizDatabase.self) ?? [:]
    }()
}
