//
//  CineniUITests.swift
//  CineniUITests
//
//  Created by Daniel Ramos on 12/8/22.
//

import XCTest

class CineniUITests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func test_shows_the_movie_list() throws {
        let app = XCUIApplication()
        app.launchArguments = ["-UITests"]
        app.launch()

        XCTAssertEqual(app.images["Vengeance"].exists, true)
        XCTAssertEqual(app.images["She-Hulk: Attorney at Law"].exists, true)
    }
}
