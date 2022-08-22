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

        print(app.images["Vengeance"].tap())
    }
}
