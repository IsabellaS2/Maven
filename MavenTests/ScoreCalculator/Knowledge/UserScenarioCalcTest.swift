//
//  UserScenarioCalcTest.swift
//  Maven
//
//  Created by Isabella Sulisufi on 14/07/2025.
//

import XCTest
@testable import Maven

final class UserScenarioCalcTests: XCTestCase {

    func testCalculateTotalUserScenarioPoints_AllValidPointsAdded() {
        let scenarios = [
            ScenarioItem(id: "1", completedOn: "2025-07-10", points: 10, expiresOn: "2025-08-01"),
            ScenarioItem(id: "2", completedOn: "2025-07-12", points: 10, expiresOn: "2025-08-10")
        ]
        let summary = UserScenariosSummary(maxTotalPoints: 60, scenarios: scenarios)
        let now = parseDate("2025-07-15")!
        
        let totalPoints = calculateTotalUserScenarioPoints(from: summary, now: now)
        XCTAssertEqual(totalPoints, 20)
    }
    
    func testCalculateTotalUserScenarioPoints_ScenarioExpired_NoPointsAdded() {
        let scenarios = [
            ScenarioItem(id: "1", completedOn: "2025-06-30", points: 10, expiresOn: "2025-07-01")
        ]
        let summary = UserScenariosSummary(maxTotalPoints: 50, scenarios: scenarios)
        let now = parseDate("2025-07-15")!
        
        let totalPoints = calculateTotalUserScenarioPoints(from: summary, now: now)
        XCTAssertEqual(totalPoints, 0)
    }
    
    func testCalculateTotalUserScenarioPoints_ScenarioCompletedAfterExpiry_NoPointsAdded() {
        let scenarios = [
            ScenarioItem(id: "1", completedOn: "2025-07-12", points: 10, expiresOn: "2025-07-10")
        ]
        let summary = UserScenariosSummary(maxTotalPoints: 50, scenarios: scenarios)
        let now = parseDate("2025-07-15")!
        
        let totalPoints = calculateTotalUserScenarioPoints(from: summary, now: now)
        XCTAssertEqual(totalPoints, 0)
    }
    
    func testCalculateTotalUserScenarioPoints_InvalidDates_NoPointsAdded() {
        let scenarios = [
            ScenarioItem(id: "1", completedOn: "invalid-date", points: 10, expiresOn: "2025-07-10"),
            ScenarioItem(id: "2", completedOn: "2025-07-10", points: 10, expiresOn: "invalid-date")
        ]
        let summary = UserScenariosSummary(maxTotalPoints: 100, scenarios: scenarios)
        let now = parseDate("2025-07-15")!
        
        let totalPoints = calculateTotalUserScenarioPoints(from: summary, now: now)
        XCTAssertEqual(totalPoints, 0)
    }
    
    func testCalculateTotalUserScenarioPoints_ExpiredButCompletedBeforeExpiry_NoPointsAdded() {
        let scenarios = [
            ScenarioItem(id: "1", completedOn: "2025-07-09", points: 10, expiresOn: "2025-07-10")
        ]
        let summary = UserScenariosSummary(maxTotalPoints: 20, scenarios: scenarios)
        let now = parseDate("2025-07-15")!
        
        let totalPoints = calculateTotalUserScenarioPoints(from: summary, now: now)
        XCTAssertEqual(totalPoints, 0)
    }
}
