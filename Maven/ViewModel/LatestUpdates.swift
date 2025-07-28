//
//  LatestUpdates.swift
//  Maven
//
//  Created by Isabella Sulisufi on 28/07/2025.
//

import Foundation

func returnCCLimitIncrease(creditCard: CreditCard?, today: Date = Date()) -> CardComponent? {
    guard let creditCard = creditCard,
          let increaseDate = parseDate(creditCard.lastLimitIncrease) else {
        return nil
    }

    let gap = Calendar.current.dateComponents([.day], from: increaseDate, to: today).day ?? Int.max
    if gap <= 30 {
        return CardComponent(
            title: "Credit card utilisation has improved this month",
            description: "Keep it up!",
            icon: "creditcard"
        )
    }

    return nil
}

func returnBNPLPayments(bnplUsage: BNPLUsageProvider?) -> CardComponent? {
    guard let usage = bnplUsage else {
        return nil
    }

    if usage.transactionsLast30Days == 0 {
        return CardComponent(
            title: "No BNPL payments this month",
            description: "Good job!",
            icon: "creditcard"
        )
    }

    return nil
}

func returnUpcomingIncome(income: Income?, today: Date = Date()) -> CardComponent? {
    guard let income = income,
          let nextDate = parseDate(income.nextExpectedDate) else {
        return nil
    }

    let days = Calendar.current.dateComponents([.day], from: today, to: nextDate).day ?? Int.max
    if days >= 0 && days <= 30 {
        return CardComponent(
            title: "Income expected on \(formatDate(nextDate))",
            description: "You're getting paid soon!",
            icon: "calendar"
        )
    }

    return nil
}

func returnRecentScenariosCard(scenarios: [ScenarioItem], today: Date = Date()) -> CardComponent? {
    let recent = scenarios.filter {
        guard let date = parseDate($0.completedOn) else { return false }
        let days = Calendar.current.dateComponents([.day], from: date, to: today).day ?? Int.max
        return days <= 30
    }

    if !recent.isEmpty {
        return CardComponent(
            title: "You've completed \(recent.count) user scenarios",
            description: "Nice work this month!",
            icon: "checkmark.circle"
        )
    }

    return nil
}

func returnRecentVideosCard(videos: [VideoItem], today: Date = Date()) -> CardComponent? {
    let recent = videos.filter {
        guard let date = parseDate($0.watchedOn) else { return false }
        let days = Calendar.current.dateComponents([.day], from: date, to: today).day ?? Int.max
        return days <= 30
    }

    if !recent.isEmpty {
        return CardComponent(
            title: "Watched \(recent.count) learning videos",
            description: "Great effort this month!",
            icon: "play.circle"
        )
    }

    return nil
}

func returnRecentQuizzesCard(quizzes: [QuizItem], today: Date = Date()) -> CardComponent? {
    let recent = quizzes.filter {
        guard let date = parseDate($0.completedOn) else { return false }
        let days = Calendar.current.dateComponents([.day], from: date, to: today).day ?? Int.max
        return days <= 30
    }

    if !recent.isEmpty {
        return CardComponent(
            title: "Completed \(recent.count) quizzes",
            description: "You're staying sharp!",
            icon: "book"
        )
    }

    return nil
}

func getPositiveLatestCards(
    creditCard: CreditCard?,
    bnpl: BNPLUsageProvider?,
    knowledge: Knowledge,
    income: Income?, today: Date = Date()) -> [CardComponent] {

    var cards: [CardComponent] = []

    if let ccCard = returnCCLimitIncrease(creditCard: creditCard, today: today) {
        cards.append(ccCard)
    }

    if let bnplCard = returnBNPLPayments(bnplUsage: bnpl) {
        cards.append(bnplCard)
    }

    if let incomeCard = returnUpcomingIncome(income: income, today: today) {
        cards.append(incomeCard)
    }

    if let quizCard = returnRecentQuizzesCard(quizzes: knowledge.quiz.quizzes, today: today) {
        cards.append(quizCard)
    }

    if let scenarioCard = returnRecentScenariosCard(scenarios: knowledge.userScenarios.scenarios, today: today) {
        cards.append(scenarioCard)
    }

    if let videoCard = returnRecentVideosCard(videos: knowledge.improveVideos.videos, today: today) {
        cards.append(videoCard)
    }

    return cards
}
