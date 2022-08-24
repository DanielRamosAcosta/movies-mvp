//
//  CineniUITests.swift
//  CineniUITests
//
//  Created by Daniel Ramos on 12/8/22.
//

import Nimble
import XCTest

class CineniUITests: XCTestCase {
    func test_shows_the_movie_list() throws {
        let app = XCUIApplication()
        app.launchArguments = ["-UITests"]
        app.launch()

        expect(app.images["Vengeance"].exists).to(beTrue())
        expect(app.images["She-Hulk: Attorney at Law"].exists).to(beTrue())
        expect(app.images["Dragon Ball Super: Super Hero"].exists).to(beTrue())
    }
}
