//
//  ComingSoonTests.swift
//  CineniUITests
//
//  Created by Daniel Ramos on 25/8/22.
//

@testable import Cineni
import Nimble
import XCTest

class ComingSoonTests: XCTestCase {
    func test_shows_the_movie_list() throws {
        let app = createApp()

        app.tabBars.buttons["Coming Soon"].tap()

        expect(app).to(haveText(theBlackPhone.title))
        expect(app).to(haveImageWithAlt(theBlackPhone.title))
    }
}
