//
//  CineniUITests.swift
//  CineniUITests
//
//  Created by Daniel Ramos on 12/8/22.
//

@testable import Cineni
import Nimble
import XCTest

class CineniUITests: XCTestCase {
    func test_shows_the_movie_list() throws {
        let app = createApp()

        expect(app).to(haveImageWithAlt(vengeance.title))
        expect(app).to(haveImageWithAlt(sheHulk.title))
        expect(app).to(haveImageWithAlt(dragonBall.title))
        expect(app).to(haveImageWithAlt(theBlackPhone.title))
    }
}
