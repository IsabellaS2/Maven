//
//  Knowledge.swift
//

struct Knowledge: Codable {
    var quiz: Quiz
    var userScenarios: UserScenariosSummary
    var improveVideos: ImproveVideos

    enum CodingKeys: String, CodingKey {
        case quiz
        case userScenarios = "user_scenarios"
        case improveVideos = "improve_videos"
    }
}

struct Quiz: Codable {
    var maxTotalPoints: Int
    var quizzes: [QuizItem]

    enum CodingKeys: String, CodingKey {
        case maxTotalPoints = "max_total_points"
        case quizzes
    }
}

struct QuizItem: Codable {
    var id: String
    var completedOn: String
    var score: Int
    var maxScore: Int
    var expiresOn: String

    enum CodingKeys: String, CodingKey {
        case id, score
        case completedOn = "completed_on"
        case maxScore = "max_score"
        case expiresOn = "expires_on"
    }
}

struct UserScenariosSummary: Codable {
    var maxTotalPoints: Int
    var scenarios: [ScenarioItem]

    enum CodingKeys: String, CodingKey {
        case maxTotalPoints = "max_total_points"
        case scenarios
    }
}

struct ScenarioItem: Codable {
    var id: String
    var completedOn: String
    var points: Int
    var expiresOn: String

    enum CodingKeys: String, CodingKey {
        case id
        case completedOn = "completed_on"
        case points
        case expiresOn = "expires_on"
    }
}

struct ImproveVideos: Codable {
    var maxTotalPoints: Int
    var videos: [VideoItem]

    enum CodingKeys: String, CodingKey {
        case maxTotalPoints = "max_total_points"
        case videos
    }
}

struct VideoItem: Codable {
    var id: String
    var watchedOn: String
    var points: Int
    var completionAmount: Double

    enum CodingKeys: String, CodingKey {
        case id, points
        case watchedOn = "watched_on"
        case completionAmount = "completion_amount"
    }
}
