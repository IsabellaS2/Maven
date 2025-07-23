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
    let correct_answer: String
    let explanation: String

    private enum CodingKeys: String, CodingKey {
        case question, options, correct_answer, explanation
    }
}

struct QuizData {
    static let allQuizzes: QuizDatabase = {
        loadJSON(fileName: "quiz", as: QuizDatabase.self) ?? [:]
    }()
}

