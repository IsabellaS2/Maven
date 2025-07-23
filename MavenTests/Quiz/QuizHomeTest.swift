//
//  QuizHomeViewTest.swift
//  Maven
//
//  Created by Isabella Sulisufi on 23/07/2025.
//

import XCTest
@testable import Maven

final class QuizHomeViewTest: XCTestCase {
    
    func testIconForCategory_returnsCorrectIcon() {
        let view = QuizHomeView(nav: NavigationViewModel(router: Router()))

        XCTAssertEqual(view.iconForCategory("Credit"), "creditcard")
        XCTAssertEqual(view.iconForCategory("Borrowing Money"), "banknote")
        XCTAssertEqual(view.iconForCategory("Accounts"), "building.columns")
        XCTAssertEqual(view.iconForCategory("Unknown"), "questionmark.circle")
    }
}
