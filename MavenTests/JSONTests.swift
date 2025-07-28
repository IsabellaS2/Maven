//
//  JSONTests.swift
//  Maven
//
//  Created by Isabella Sulisufi on 28/07/2025.
//

import XCTest
@testable import Maven

class UserDecodingTests: XCTestCase {

    func testBuilderJSON() {
        let testBundle = Bundle(for: type(of: self))

        guard let userData: UserData = loadJSON(fileName: "builderEx", as: UserData.self, in: testBundle) else {
            XCTFail("Failed to load builderEx.json")
            return
        }

        let user = userData.user

        XCTAssertEqual(user.name, "Sam Builder")
        XCTAssertEqual(user.id, "builder_001")
        XCTAssertFalse(user.id.isEmpty, "User ID should not be empty")
    }
}
