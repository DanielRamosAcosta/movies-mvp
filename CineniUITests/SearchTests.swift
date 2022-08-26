//
//  SearchTests.swift
//  CineniUITests
//
//  Created by Daniel Ramos on 25/8/22.
//

@testable import Cineni
import Nimble
import XCTest

class SearchTests: XCTestCase {
    func test_shows_top_search_by_default() throws {
        let app = createApp()

        app.tabBars.buttons["search"].tap()

        expect(app).to(haveText(vengeance.title))
        expect(app).to(haveImageWithAlt(vengeance.title))
        expect(app).to(haveText(dragonBall.title))
        expect(app).to(haveImageWithAlt(dragonBall.title))
        expect(app).to(haveText(theBlackPhone.title))
        expect(app).to(haveImageWithAlt(theBlackPhone.title))
    }

    func test_that_searchs_for_movies() throws {
        let app = createApp()

        app.tabBars.buttons["search"].tap()
        app.swipeDown()
        app.searchFields.firstMatch.tap()
        app.typeText(memento.title)

        expect { app }.toEventually(haveImageWithAlt(memento.title))
    }
}
