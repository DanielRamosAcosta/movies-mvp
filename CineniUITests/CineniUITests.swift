//
//  CineniUITests.swift
//  CineniUITests
//
//  Created by Daniel Ramos on 12/8/22.
//

import XCTest
import Nimble

class CineniUITests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func test_shows_the_movie_list() throws {
        let app = XCUIApplication()
        app.launchArguments = ["-UITests"]
        app.launch()

        expect(app.images["Vengeance"].exists).to(beTrue())
        expect(app.images["She-Hulk: Attorney at Law"].exists).to(beTrue())
    }
}
