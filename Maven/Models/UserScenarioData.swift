//
//  UserScenarioData.swift
//  Maven
//
//  Created by Isabella Sulisufi on 27/05/2025.
//

import Foundation

struct UserScenarios: Codable {
    var elliesCreditCardStruggles: Scenario
    var mariasBnplTrouble: Scenario
    var marcussMortgageMisunderstanding: Scenario
    var sarahsCreditCardBalanceTransferMisstep: Scenario
    var jakesDebtManagementStruggles: Scenario
    var mofizsCarLoanOversight: Scenario

    enum CodingKeys: String, CodingKey {
        case elliesCreditCardStruggles = "ellies_credit_card_struggles"
        case mariasBnplTrouble = "marias_bnpl_trouble"
        case marcussMortgageMisunderstanding = "marcuss_mortgage_misunderstanding"
        case sarahsCreditCardBalanceTransferMisstep = "sarahs_credit_card_balance_transfer_misstep"
        case jakesDebtManagementStruggles = "jakes_debt_management_struggles"
        case mofizsCarLoanOversight = "mofizs_car_loan_oversight"
    }
}

struct Scenario: Codable {
    var title: String
    var subtitle: String
    var image: String?
    var description1: String
    var description2: String
    var description3: String
    var description4: String
    var whatWentWrong: WhatWentWrong
    var howToSort: HowToSort
    var haveDoneDifferently: HaveDoneDifferently
    var solutionsAndResources: SolutionsAndResources

    enum CodingKeys: String, CodingKey {
        case title, subtitle, image
        case description1 = "description_1"
        case description2 = "description_2"
        case description3 = "description_3"
        case description4 = "description_4"
        case whatWentWrong = "what_went_wrong"
        case howToSort = "how_to_sort"
        case haveDoneDifferently = "have_done_differently"
        case solutionsAndResources = "solutions_and_resources"
    }
}

struct WhatWentWrong: Codable {
    var title: String
    var text1: String
    var text2: String
    var text3: String

    enum CodingKeys: String, CodingKey {
        case title
        case text1 = "text_1"
        case text2 = "text_2"
        case text3 = "text_3"
    }
}

struct HowToSort: Codable {
    var title: String
    var text1: String
    var text2: String
    var text3: String

    enum CodingKeys: String, CodingKey {
        case title
        case text1 = "text_1"
        case text2 = "text_2"
        case text3 = "text_3"
    }
}

struct HaveDoneDifferently: Codable {
    var title: String
    var text1: String
    var text2: String
    var text3: String

    enum CodingKeys: String, CodingKey {
        case title
        case text1 = "text_1"
        case text2 = "text_2"
        case text3 = "text_3"
    }
}

struct SolutionsAndResources: Codable {
    var title: String
    var text1: String
    var text2: String
    var text3: String

    enum CodingKeys: String, CodingKey {
        case title
        case text1 = "text_1"
        case text2 = "text_2"
        case text3 = "text_3"
    }
}
