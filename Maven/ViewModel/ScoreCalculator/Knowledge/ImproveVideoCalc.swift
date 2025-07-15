//
//  ImproveVideoCalc.swift
//  Maven
//
//  Created by Isabella Sulisufi on 15/07/2025.
//

import Foundation

func calculateTotalImproveVideoPoints(from improveVideos: ImproveVideos, today: Date = Date()) -> Int {
    return improveVideos.videos.reduce(0) { total, video in
        guard let watchedDate = parseDate(video.watchedOn) else {
            print("❌ Failed to parse watched date for video \(video.id)")
            return total
        }

        let daysSinceWatched = Calendar.current.dateComponents([.day], from: watchedDate, to: today).day ?? Int.max
        if daysSinceWatched > 30 {
            print("⏳ Video \(video.id) watched too long ago: \(daysSinceWatched) days")
            return total
        }

        if video.completionAmount < 0.85 {
            print("📉 Video \(video.id) completion too low: \(video.completionAmount)")
            return total
        }

        print("✅ Counting video \(video.id) for \(video.points) points")
        return total + video.points
    }
}
