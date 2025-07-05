//
//  UserData.swift
//

import Foundation

// MARK: - Root
struct UserData: Codable {
    var user: User
    var behaviour: Behaviour
    var knowledge: Knowledge
}

// MARK: - User
struct User: Codable {
    var id: String
    var name: String
    var email: String
}
