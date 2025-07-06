////
////  MavenTests.swift
////  MavenTests
////
////  Created by Isabella Sulisufi on 08/05/2025.
////
//
//import XCTest
//@testable import Maven
//
//final class MavenTests: XCTestCase {
//
//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    // MARK: - Model Tests
//    
//    func testScenarioModelInitialization() throws {
//        // Test that Scenario model can be initialized with all required properties
//        let scenario = Scenario(
//            title: "Test Title",
//            subtitle: "Test Subtitle",
//            image: "test_image",
//            description_1: "Description 1",
//            description_2: "Description 2",
//            description_3: "Description 3",
//            description_4: "Description 4",
//            what_went_wrong: WhatWentWrong(title: "Wrong Title", text_1: "Text 1", text_2: "Text 2", text_3: "Text 3"),
//            how_to_sort: HowToSort(title: "Sort Title", text_1: "Text 1", text_2: "Text 2", text_3: "Text 3"),
//            have_done_differently: HaveDoneDifferently(title: "Different Title", text_1: "Text 1", text_2: "Text 2", text_3: "Text 3"),
//            solutions_and_resources: SolutionsAndResources(title: "Solutions Title", text_1: "Text 1", text_2: "Text 2", text_3: "Text 3")
//        )
//        
//        XCTAssertEqual(scenario.title, "Test Title")
//        XCTAssertEqual(scenario.subtitle, "Test Subtitle")
//        XCTAssertEqual(scenario.image, "test_image")
//        XCTAssertEqual(scenario.what_went_wrong.title, "Wrong Title")
//        XCTAssertEqual(scenario.how_to_sort.title, "Sort Title")
//        XCTAssertEqual(scenario.have_done_differently.title, "Different Title")
//        XCTAssertEqual(scenario.solutions_and_resources.title, "Solutions Title")
//    }
//    
//    func testWhatWentWrongModel() throws {
//        // Test WhatWentWrong model properties
//        let whatWentWrong = WhatWentWrong(
//            title: "Test Title",
//            text_1: "First text",
//            text_2: "Second text",
//            text_3: "Third text"
//        )
//        
//        XCTAssertEqual(whatWentWrong.title, "Test Title")
//        XCTAssertEqual(whatWentWrong.text_1, "First text")
//        XCTAssertEqual(whatWentWrong.text_2, "Second text")
//        XCTAssertEqual(whatWentWrong.text_3, "Third text")
//    }
//    
//    func testHowToSortModel() throws {
//        // Test HowToSort model properties
//        let howToSort = HowToSort(
//            title: "Sort Title",
//            text_1: "First solution",
//            text_2: "Second solution",
//            text_3: "Third solution"
//        )
//        
//        XCTAssertEqual(howToSort.title, "Sort Title")
//        XCTAssertEqual(howToSort.text_1, "First solution")
//        XCTAssertEqual(howToSort.text_2, "Second solution")
//        XCTAssertEqual(howToSort.text_3, "Third solution")
//    }
//    
//    // MARK: - JSON Loading Tests
//    
//    func testLoadScenariosFromBundle() throws {
//        // Test that scenarios.json can be loaded from bundle
//        let scenarios = loadScenarios()
//        XCTAssertNotNil(scenarios, "Scenarios should load successfully from bundle")
//        
//        guard let scenarios = scenarios else {
//            XCTFail("Failed to load scenarios from bundle")
//            return
//        }
//        
//        // Verify all scenarios are loaded
//        XCTAssertNotNil(scenarios.elliesCreditCardStruggles)
//        XCTAssertNotNil(scenarios.mariasBnplTrouble)
//        XCTAssertNotNil(scenarios.marcussMortgageMisunderstanding)
//        XCTAssertNotNil(scenarios.sarahsCreditCardBalanceTransferMisstep)
//        XCTAssertNotNil(scenarios.jakesDebtManagementStruggles)
//        XCTAssertNotNil(scenarios.mofizsCarLoanOversight)
//    }
//    
//    func testEllieScenarioContent() throws {
//        // Test specific content from Ellie's scenario
//        let scenarios = loadScenarios()
//        XCTAssertNotNil(scenarios)
//        
//        guard let scenarios = scenarios else {
//            XCTFail("Failed to load scenarios")
//            return
//        }
//        
//        let ellieScenario = scenarios.elliesCreditCardStruggles
//        XCTAssertEqual(ellieScenario.title, "Ellie's Credit Card Struggles")
//        XCTAssertEqual(ellieScenario.subtitle, "User Scenario - Credit Cards")
//        XCTAssertTrue(ellieScenario.description_1.contains("Ellie"))
//        XCTAssertTrue(ellieScenario.what_went_wrong.title.contains("wrong"))
//        XCTAssertTrue(ellieScenario.how_to_sort.title.contains("sort"))
//    }
//    
//    func testMariaScenarioContent() throws {
//        // Test specific content from Maria's scenario
//        let scenarios = loadScenarios()
//        XCTAssertNotNil(scenarios)
//        
//        guard let scenarios = scenarios else {
//            XCTFail("Failed to load scenarios")
//            return
//        }
//        
//        let mariaScenario = scenarios.mariasBnplTrouble
//        XCTAssertEqual(mariaScenario.title, "Maria's BNPL Trouble")
//        XCTAssertEqual(mariaScenario.subtitle, "User Scenario - BNPL")
//        XCTAssertTrue(mariaScenario.description_1.contains("Maria"))
//        XCTAssertTrue(mariaScenario.description_2.contains("freelance designer"))
//    }
//    
//    func testSarahScenarioContent() throws {
//        // Test specific content from Sarah's scenario
//        let scenarios = loadScenarios()
//        XCTAssertNotNil(scenarios)
//        
//        guard let scenarios = scenarios else {
//            XCTFail("Failed to load scenarios")
//            return
//        }
//        
//        let sarahScenario = scenarios.sarahsCreditCardBalanceTransferMisstep
//        XCTAssertEqual(sarahScenario.title, "Sarah's Credit Card Balance Transfer Misstep")
//        XCTAssertEqual(sarahScenario.subtitle, "User Scenario - Credit Cards - Balance Transfer")
//        XCTAssertTrue(sarahScenario.description_1.contains("Sarah"))
//        XCTAssertTrue(sarahScenario.description_2.contains("nurse"))
//    }
//    
//    // MARK: - JSON Decoding Tests
//    
//    func testUserScenarioDecodingFromValidJSON() throws {
//        // Test that UserScenarios can be decoded from valid JSON
//        let jsonData = """
//        {
//            "ellies_credit_card_struggles": {
//                "title": "Test Title",
//                "subtitle": "Test Subtitle",
//                "description_1": "Description 1",
//                "description_2": "Description 2",
//                "description_3": "Description 3",
//                "description_4": "Description 4",
//                "what_went_wrong": {
//                    "title": "What Went Wrong",
//                    "text_1": "Text 1",
//                    "text_2": "Text 2",
//                    "text_3": "Text 3"
//                },
//                "how_to_sort": {
//                    "title": "How to Sort",
//                    "text_1": "Text 1",
//                    "text_2": "Text 2",
//                    "text_3": "Text 3"
//                },
//                "have_done_differently": {
//                    "title": "Have Done Differently",
//                    "text_1": "Text 1",
//                    "text_2": "Text 2",
//                    "text_3": "Text 3"
//                },
//                "solutions_and_resources": {
//                    "title": "Solutions",
//                    "text_1": "Text 1",
//                    "text_2": "Text 2",
//                    "text_3": "Text 3"
//                }
//            },
//            "marias_bnpl_trouble": {
//                "title": "Test Title 2",
//                "subtitle": "Test Subtitle 2",
//                "description_1": "Description 1",
//                "description_2": "Description 2",
//                "description_3": "Description 3",
//                "description_4": "Description 4",
//                "what_went_wrong": {
//                    "title": "What Went Wrong 2",
//                    "text_1": "Text 1",
//                    "text_2": "Text 2",
//                    "text_3": "Text 3"
//                },
//                "how_to_sort": {
//                    "title": "How to Sort 2",
//                    "text_1": "Text 1",
//                    "text_2": "Text 2",
//                    "text_3": "Text 3"
//                },
//                "have_done_differently": {
//                    "title": "Have Done Differently 2",
//                    "text_1": "Text 1",
//                    "text_2": "Text 2",
//                    "text_3": "Text 3"
//                },
//                "solutions_and_resources": {
//                    "title": "Solutions 2",
//                    "text_1": "Text 1",
//                    "text_2": "Text 2",
//                    "text_3": "Text 3"
//                }
//            },
//            "marcuss_mortgage_misunderstanding": {
//                "title": "Test Title 3",
//                "subtitle": "Test Subtitle 3",
//                "description_1": "Description 1",
//                "description_2": "Description 2",
//                "description_3": "Description 3",
//                "description_4": "Description 4",
//                "what_went_wrong": {
//                    "title": "What Went Wrong 3",
//                    "text_1": "Text 1",
//                    "text_2": "Text 2",
//                    "text_3": "Text 3"
//                },
//                "how_to_sort": {
//                    "title": "How to Sort 3",
//                    "text_1": "Text 1",
//                    "text_2": "Text 2",
//                    "text_3": "Text 3"
//                },
//                "have_done_differently": {
//                    "title": "Have Done Differently 3",
//                    "text_1": "Text 1",
//                    "text_2": "Text 2",
//                    "text_3": "Text 3"
//                },
//                "solutions_and_resources": {
//                    "title": "Solutions 3",
//                    "text_1": "Text 1",
//                    "text_2": "Text 2",
//                    "text_3": "Text 3"
//                }
//            },
//            "sarahs_credit_card_balance_transfer_misstep": {
//                "title": "Test Title 4",
//                "subtitle": "Test Subtitle 4",
//                "description_1": "Description 1",
//                "description_2": "Description 2",
//                "description_3": "Description 3",
//                "description_4": "Description 4",
//                "what_went_wrong": {
//                    "title": "What Went Wrong 4",
//                    "text_1": "Text 1",
//                    "text_2": "Text 2",
//                    "text_3": "Text 3"
//                },
//                "how_to_sort": {
//                    "title": "How to Sort 4",
//                    "text_1": "Text 1",
//                    "text_2": "Text 2",
//                    "text_3": "Text 3"
//                },
//                "have_done_differently": {
//                    "title": "Have Done Differently 4",
//                    "text_1": "Text 1",
//                    "text_2": "Text 2",
//                    "text_3": "Text 3"
//                },
//                "solutions_and_resources": {
//                    "title": "Solutions 4",
//                    "text_1": "Text 1",
//                    "text_2": "Text 2",
//                    "text_3": "Text 3"
//                }
//            },
//            "jakes_debt_management_struggles": {
//                "title": "Test Title 5",
//                "subtitle": "Test Subtitle 5",
//                "description_1": "Description 1",
//                "description_2": "Description 2",
//                "description_3": "Description 3",
//                "description_4": "Description 4",
//                "what_went_wrong": {
//                    "title": "What Went Wrong 5",
//                    "text_1": "Text 1",
//                    "text_2": "Text 2",
//                    "text_3": "Text 3"
//                },
//                "how_to_sort": {
//                    "title": "How to Sort 5",
//                    "text_1": "Text 1",
//                    "text_2": "Text 2",
//                    "text_3": "Text 3"
//                },
//                "have_done_differently": {
//                    "title": "Have Done Differently 5",
//                    "text_1": "Text 1",
//                    "text_2": "Text 2",
//                    "text_3": "Text 3"
//                },
//                "solutions_and_resources": {
//                    "title": "Solutions 5",
//                    "text_1": "Text 1",
//                    "text_2": "Text 2",
//                    "text_3": "Text 3"
//                }
//            },
//            "mofizs_car_loan_oversight": {
//                "title": "Test Title 6",
//                "subtitle": "Test Subtitle 6",
//                "description_1": "Description 1",
//                "description_2": "Description 2",
//                "description_3": "Description 3",
//                "description_4": "Description 4",
//                "what_went_wrong": {
//                    "title": "What Went Wrong 6",
//                    "text_1": "Text 1",
//                    "text_2": "Text 2",
//                    "text_3": "Text 3"
//                },
//                "how_to_sort": {
//                    "title": "How to Sort 6",
//                    "text_1": "Text 1",
//                    "text_2": "Text 2",
//                    "text_3": "Text 3"
//                },
//                "have_done_differently": {
//                    "title": "Have Done Differently 6",
//                    "text_1": "Text 1",
//                    "text_2": "Text 2",
//                    "text_3": "Text 3"
//                },
//                "solutions_and_resources": {
//                    "title": "Solutions 6",
//                    "text_1": "Text 1",
//                    "text_2": "Text 2",
//                    "text_3": "Text 3"
//                }
//            }
//        }
//        """.data(using: .utf8)!
//        
//        let decoder = JSONDecoder()
//        XCTAssertNoThrow(try decoder.decode(UserScenarios.self, from: jsonData))
//        
//        let scenarios = try decoder.decode(UserScenarios.self, from: jsonData)
//        XCTAssertEqual(scenarios.elliesCreditCardStruggles.title, "Test Title")
//        XCTAssertEqual(scenarios.mariasBnplTrouble.title, "Test Title 2")
//    }
//    
//    func testScenarioDecodingWithMissingFields() throws {
//        // Test that decoding fails gracefully when required fields are missing
//        let incompleteJsonData = """
//        {
//            "ellies_credit_card_struggles": {
//                "title": "Test Title"
//            }
//        }
//        """.data(using: .utf8)!
//        
//        let decoder = JSONDecoder()
//        XCTAssertThrowsError(try decoder.decode(UserScenarios.self, from: incompleteJsonData))
//    }
//    
//    // MARK: - Validation Tests
//    
//    func testAllScenariosHaveRequiredFields() throws {
//        // Test that all scenarios have required fields populated
//        let scenarios = loadScenarios()
//        XCTAssertNotNil(scenarios)
//        
//        guard let scenarios = scenarios else {
//            XCTFail("Failed to load scenarios")
//            return
//        }
//        
//        let allScenarios = [
//            scenarios.elliesCreditCardStruggles,
//            scenarios.mariasBnplTrouble,
//            scenarios.marcussMortgageMisunderstanding,
//            scenarios.sarahsCreditCardBalanceTransferMisstep,
//            scenarios.jakesDebtManagementStruggles,
//            scenarios.mofizsCarLoanOversight
//        ]
//        
//        for scenario in allScenarios {
//            XCTAssertFalse(scenario.title.isEmpty, "Title should not be empty")
//            XCTAssertFalse(scenario.subtitle.isEmpty, "Subtitle should not be empty")
//            XCTAssertFalse(scenario.description_1.isEmpty, "Description 1 should not be empty")
//            XCTAssertFalse(scenario.description_2.isEmpty, "Description 2 should not be empty")
//            XCTAssertFalse(scenario.description_3.isEmpty, "Description 3 should not be empty")
//            XCTAssertFalse(scenario.description_4.isEmpty, "Description 4 should not be empty")
//            XCTAssertFalse(scenario.what_went_wrong.title.isEmpty, "What went wrong title should not be empty")
//            XCTAssertFalse(scenario.how_to_sort.title.isEmpty, "How to sort title should not be empty")
//            XCTAssertFalse(scenario.have_done_differently.title.isEmpty, "Have done differently title should not be empty")
//            XCTAssertFalse(scenario.solutions_and_resources.title.isEmpty, "Solutions title should not be empty")
//        }
//    }
//    
//    func testScenariosHaveValidContent() throws {
//        // Test that scenarios contain meaningful content
//        let scenarios = loadScenarios()
//        XCTAssertNotNil(scenarios)
//        
//        guard let scenarios = scenarios else {
//            XCTFail("Failed to load scenarios")
//            return
//        }
//        
//        // Test Ellie's scenario has expected content
//        let ellieScenario = scenarios.elliesCreditCardStruggles
//        XCTAssertTrue(ellieScenario.title.contains("Ellie"))
//        XCTAssertTrue(ellieScenario.title.contains("Credit Card"))
//        XCTAssertTrue(ellieScenario.what_went_wrong.text_1.contains("💰"))
//        XCTAssertTrue(ellieScenario.how_to_sort.text_1.contains("🏦"))
//        
//        // Test Maria's scenario has expected content
//        let mariaScenario = scenarios.mariasBnplTrouble
//        XCTAssertTrue(mariaScenario.title.contains("Maria"))
//        XCTAssertTrue(mariaScenario.title.contains("BNPL"))
//        XCTAssertTrue(mariaScenario.what_went_wrong.text_1.contains("📆"))
//        
//        // Test Sarah's scenario has expected content
//        let sarahScenario = scenarios.sarahsCreditCardBalanceTransferMisstep
//        XCTAssertTrue(sarahScenario.title.contains("Sarah"))
//        XCTAssertTrue(sarahScenario.title.contains("Balance Transfer"))
//        XCTAssertTrue(sarahScenario.what_went_wrong.text_1.contains("💸"))
//    }
//    
//    // MARK: - Performance Tests
//    
//    func testLoadScenariosPerformance() throws {
//        // Test that loading scenarios is performant
//        self.measure {
//            let _ = loadScenarios()
//        }
//    }
//    
//    func testJSONDecodingPerformance() throws {
//        // Test JSON decoding performance
//        guard let url = Bundle.main.url(forResource: "scenarios", withExtension: "json") else {
//            XCTFail("Could not find scenarios.json")
//            return
//        }
//        
//        let data = try Data(contentsOf: url)
//        
//        self.measure {
//            let _ = try? JSONDecoder().decode(UserScenarios.self, from: data)
//        }
//    }
//    
//    // MARK: - Bundle Resource Tests
//    
//    func testScenariosJSONExists() throws {
//        // Test that scenarios.json exists in the bundle
//        let url = Bundle.main.url(forResource: "scenarios", withExtension: "json")
//        XCTAssertNotNil(url, "scenarios.json should exist in the app bundle")
//    }
//    
//    func testScenariosJSONIsValidJSON() throws {
//        // Test that scenarios.json contains valid JSON
//        guard let url = Bundle.main.url(forResource: "scenarios", withExtension: "json") else {
//            XCTFail("Could not find scenarios.json")
//            return
//        }
//        
//        let data = try Data(contentsOf: url)
//        XCTAssertNoThrow(try JSONSerialization.jsonObject(with: data, options: []))
//    }
//    
//    // MARK: - Edge Cases
//    
//    func testEmptyScenarioHandling() throws {
//        // Test handling of scenarios with empty optional fields
//        let scenarios = loadScenarios()
//        XCTAssertNotNil(scenarios)
//        
//        guard let scenarios = scenarios else {
//            XCTFail("Failed to load scenarios")
//            return
//        }
//        
//        // Test that image field can be nil (it's optional)
//        let allScenarios = [
//            scenarios.elliesCreditCardStruggles,
//            scenarios.mariasBnplTrouble,
//            scenarios.marcussMortgageMisunderstanding,
//            scenarios.sarahsCreditCardBalanceTransferMisstep,
//            scenarios.jakesDebtManagementStruggles,
//            scenarios.mofizsCarLoanOversight
//        ]
//        
//        for scenario in allScenarios {
//            // Image field is optional, so this should not cause issues
//            // Just verify the scenario is valid
//            XCTAssertNotNil(scenario.title)
//            XCTAssertNotNil(scenario.subtitle)
//        }
//    }
//    
//    func testScenarioDescriptionSequence() throws {
//        // Test that all description fields are populated in sequence
//        let scenarios = loadScenarios()
//        XCTAssertNotNil(scenarios)
//        
//        guard let scenarios = scenarios else {
//            XCTFail("Failed to load scenarios")
//            return
//        }
//        
//        let allScenarios = [
//            scenarios.elliesCreditCardStruggles,
//            scenarios.mariasBnplTrouble,
//            scenarios.marcussMortgageMisunderstanding,
//            scenarios.sarahsCreditCardBalanceTransferMisstep,
//            scenarios.jakesDebtManagementStruggles,
//            scenarios.mofizsCarLoanOversight
//        ]
//        
//        for scenario in allScenarios {
//            XCTAssertFalse(scenario.description_1.isEmpty, "Description 1 should not be empty")
//            XCTAssertFalse(scenario.description_2.isEmpty, "Description 2 should not be empty")
//            XCTAssertFalse(scenario.description_3.isEmpty, "Description 3 should not be empty")
//            XCTAssertFalse(scenario.description_4.isEmpty, "Description 4 should not be empty")
//            
//            // Check that each description is unique
//            XCTAssertNotEqual(scenario.description_1, scenario.description_2)
//            XCTAssertNotEqual(scenario.description_2, scenario.description_3)
//            XCTAssertNotEqual(scenario.description_3, scenario.description_4)
//        }
//    }
//}
