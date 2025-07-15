//
//  ImproveVideoCalcTest.swift
//  Maven
//
//  Created by Isabella Sulisufi on 15/07/2025.
//

import XCTest
@testable import Maven

final class ImproveVideoCalcTest: XCTestCase {
    let fixedNow = parseDate("2025-07-10")!

    func testAllValidVideos() {
        let improveVideos = ImproveVideos(
            maxTotalPoints: 50,
            videos: [
                VideoItem(id: "video_001", watchedOn: "2025-07-15", points: 6, completionAmount: 0.90),
                VideoItem(id: "video_002", watchedOn: "2025-07-15", points: 6, completionAmount: 0.95),
                VideoItem(id: "video_003", watchedOn: "2025-07-15", points: 6, completionAmount: 1.0)
            ]
        )

        let total = calculateTotalImproveVideoPoints(from: improveVideos, today: fixedNow)
        XCTAssertEqual(total, 18)
    }
    
    func testOneValidVideos() {
        let improveVideos = ImproveVideos(
            maxTotalPoints: 50,
            videos: [
                VideoItem(id: "video_001", watchedOn: "2025-07-15", points: 6, completionAmount: 0.90),
            ]
        )

        let total = calculateTotalImproveVideoPoints(from: improveVideos, today: fixedNow)
        XCTAssertEqual(total, 6)
    }

    func testSomeInvalidVideos() {
        let improveVideos = ImproveVideos(
            maxTotalPoints: 50,
            videos: [
                VideoItem(id: "video_001", watchedOn: "2025-05-15", points: 6, completionAmount: 0.90), // expired
                VideoItem(id: "video_002", watchedOn: "2025-05-01", points: 6, completionAmount: 0.95), // watched >30 days ago
                VideoItem(id: "video_003", watchedOn: "2025-07-01", points: 6, completionAmount: 0.80)  // completion < 0.85
            ]
        )

        let total = calculateTotalImproveVideoPoints(from: improveVideos, today: fixedNow)
        XCTAssertEqual(total, 0)
    }

    func testMixedValidAndInvalidVideos() {
        let improveVideos = ImproveVideos(
            maxTotalPoints: 50,
            videos: [
                VideoItem(id: "video_001", watchedOn: "2025-07-15", points: 6, completionAmount: 0.90),
                VideoItem(id: "video_002", watchedOn: "2025-07-01", points: 6, completionAmount: 0.95),
                VideoItem(id: "video_003", watchedOn: "2025-05-01", points: 6, completionAmount: 0.90), // watched >30 days ago
                VideoItem(id: "video_004", watchedOn: "2025-06-01", points: 6, completionAmount: 0.90)   // expired
            ]
        )

        let total = calculateTotalImproveVideoPoints(from: improveVideos, today: fixedNow)
        XCTAssertEqual(total, 12) // video_001 + video_002 only
    }
    
    func testVideoWatchedExactly30DaysAgo() {
        let improveVideos = ImproveVideos(
            maxTotalPoints: 50,
            videos: [
                VideoItem(id: "video_001", watchedOn: "2025-06-10", points: 6, completionAmount: 0.90) // exactly 30 days before fixedNow (2025-07-10)
            ]
        )
        
        let total = calculateTotalImproveVideoPoints(from: improveVideos, today: fixedNow)
        XCTAssertEqual(total, 6)
    }
    
    func testVideoCompletionAtThreshold() {
        let improveVideos = ImproveVideos(
            maxTotalPoints: 50,
            videos: [
                VideoItem(id: "video_001", watchedOn: "2025-07-05", points: 6, completionAmount: 0.85)
            ]
        )
        
        let total = calculateTotalImproveVideoPoints(from: improveVideos, today: fixedNow)
        XCTAssertEqual(total, 6)
    }


    func testEmptyVideos() {
        let improveVideos = ImproveVideos(maxTotalPoints: 50, videos: [])

        let total = calculateTotalImproveVideoPoints(from: improveVideos, today: fixedNow)
        XCTAssertEqual(total, 0)
    }
}
