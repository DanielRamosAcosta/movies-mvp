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
        let movies = try awaitPublisher(movieRepositoryApi.getTrendingMovies())

        expect(movies).to(haveCount(20))
    }

    func test_gets_trending_tv_shows() throws {
        let tvShows = try awaitPublisher(movieRepositoryApi.getTrendingTVShows())

        expect(tvShows).to(haveCount(20))
    }

    func test_gets_popular_movies() throws {
        let movies = try awaitPublisher(movieRepositoryApi.getPopularMovies())

        expect(movies).to(haveCount(20))
    }

    func test_gets_upcoming_movies() throws {
        let movies = try awaitPublisher(movieRepositoryApi.getUpcomingMovies())

        expect(movies).to(haveCount(20))
    }
}
