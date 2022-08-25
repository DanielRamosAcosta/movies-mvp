//
//  MovieRepositoryApiTests.swift
//  CineniTests
//
//  Created by Daniel Ramos on 23/8/22.
//

@testable import Cineni
import Nimble
import XCTest

class MovieRepositoryApiTests: XCTestCase {
    var movieRepositoryApi = MovieRepositoryApi()

    func test_gets_trending_movies() throws {
        let movies = try awaitPublisher(movieRepositoryApi.getTrending())

        expect(movies).to(haveCount(20))
    }

    func test_gets_popular_movies() throws {
        let movies = try awaitPublisher(movieRepositoryApi.getPopular())

        expect(movies).to(haveCount(20))
    }

    func test_gets_upcoming_movies() throws {
        let movies = try awaitPublisher(movieRepositoryApi.getUpcoming())

        expect(movies).to(haveCount(20))
    }

    func test_gets_top_rated_movies() throws {
        let movies = try awaitPublisher(movieRepositoryApi.getTopRated())

        expect(movies).to(haveCount(20))
    }
}
