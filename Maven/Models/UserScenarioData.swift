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
    var description_1: String
    var description_2: String
    var description_3: String
    var description_4: String
    var what_went_wrong: WhatWentWrong
    var how_to_sort: HowToSort
    var have_done_differently: HaveDoneDifferently
    var solutions_and_resources: SolutionsAndResources
}
struct WhatWentWrong: Codable {
    var title: String
    var text_1: String
    var text_2: String
    var text_3: String
}

struct HowToSort: Codable {
    var title: String
    var text_1: String
    var text_2: String
    var text_3: String
}

struct HaveDoneDifferently: Codable {
    var title: String
    var text_1: String
    var text_2: String
    var text_3: String
}

struct SolutionsAndResources: Codable {
    var title: String
    var text_1: String
    var text_2: String
    var text_3: String
}
