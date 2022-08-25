//
//  TVShowRepositoryApiTests.swift
//  CineniTests
//
//  Created by Daniel Ramos on 25/8/22.
//

@testable import Cineni
import Nimble
import XCTest

class TVShowRepositoryApiTests: XCTestCase {
    var tvShowRepositoryApi = TVShowRepositoryApi()

    func test_gets_trending_tv_shows() throws {
        let tvShows = try awaitPublisher(tvShowRepositoryApi.getTrendingTVShows())

        expect(tvShows).to(haveCount(20))
    }
}
