//
//  UserScenarioCalcTest.swift
//  Maven
//
//  Created by Isabella Sulisufi on 14/07/2025.
//

import XCTest
@testable import Maven

final class UserScenarioCalcTest: XCTestCase {
    func testCalculateSixScenariosTotalPoints() {
        let scenarios = makeScenarios(count: 6, points: 10)
        let summary = UserScenariosSummary(maxTotalPoints: 60, scenarios: scenarios)
        XCTAssertEqual(calculateTotalUserScenarioPoints(from: summary), 60)
    }
    
    func testCalculateFiveScenariosTotalPoints() {
        let scenarios = makeScenarios(count: 5, points: 10)
        let summary = UserScenariosSummary(maxTotalPoints: 60, scenarios: scenarios)
        XCTAssertEqual(calculateTotalUserScenarioPoints(from: summary), 50)
    }
    
    func testCalculateFourScenariosTotalPoints() {
        let scenarios = makeScenarios(count: 4, points: 10)
        let summary = UserScenariosSummary(maxTotalPoints: 60, scenarios: scenarios)
        XCTAssertEqual(calculateTotalUserScenarioPoints(from: summary), 40)
    }
    
    func testCalculateThreeScenariosTotalPoints() {
        let scenarios = makeScenarios(count: 3, points: 10)
        let summary = UserScenariosSummary(maxTotalPoints: 60, scenarios: scenarios)
        XCTAssertEqual(calculateTotalUserScenarioPoints(from: summary), 30)
    }
    
    func testCalculateTwoScenariosTotalPoints() {
        let scenarios = makeScenarios(count: 2, points: 10)
        let summary = UserScenariosSummary(maxTotalPoints: 60, scenarios: scenarios)
        XCTAssertEqual(calculateTotalUserScenarioPoints(from: summary), 20)
    }
    
    func testCalculateOneScenarioTotalPoints() {
        let scenarios = makeScenarios(count: 1, points: 10)
        let summary = UserScenariosSummary(maxTotalPoints: 60, scenarios: scenarios)
        XCTAssertEqual(calculateTotalUserScenarioPoints(from: summary), 10)
    }
    
    func testCalculateExpiredScenarioNoPoints() {
        let scenarios = [
            ScenarioItem(
                id: "scenario_001",
                completedOn: "2025-06-01T00:00:00Z",
                points: 10,
                expiresOn: "2000-01-01T00:00:00Z"  // expired
            )
        ]
        let summary = UserScenariosSummary(maxTotalPoints: 60, scenarios: scenarios)
        XCTAssertEqual(calculateTotalUserScenarioPoints(from: summary), 0)
    }
    
    func testCalculateScenarioWithZeroPoints() {
        let scenarios = [
            ScenarioItem(
                id: "scenario_001",
                completedOn: "2025-06-01T00:00:00Z",
                points: 0,
                expiresOn: "2099-12-31T00:00:00Z"
            )
        ]
        let summary = UserScenariosSummary(maxTotalPoints: 60, scenarios: scenarios)
        XCTAssertEqual(calculateTotalUserScenarioPoints(from: summary), 0)
    }
    
    // MARK: - Helper
    private func makeScenarios(count: Int, points: Int) -> [ScenarioItem] {
        let baseCompletedOn = "2025-06-01T00:00:00Z"
        let baseExpiresOn = "2099-12-31T00:00:00Z"
        
        return (1...count).map { i in
            ScenarioItem(
                id: "scenario_00\(i)",
                completedOn: baseCompletedOn,
                points: points,
                expiresOn: baseExpiresOn
            )
        }
    }
}
