//
//  MovieRepositoryApiTests.swift
//  CineniTests
//
//  Created by Daniel Ramos on 23/8/22.
//

@testable import Cineni
import Foundation
import Nimble
import Quick

class MovieRepositoryApiSpec: QuickSpec {
    override func spec() {
        it("gets trending movies") {
            let movieRepositoryApi = MovieRepositoryApi()

            let movies = try self.awaitPublisher(movieRepositoryApi.getTrendingMovies())

            expect(movies).to(haveCount(20))
        }

        it("gets trending tv shows") {
            let movieRepositoryApi = MovieRepositoryApi()

            let tvShows = try self.awaitPublisher(movieRepositoryApi.getTrendingTVShows())

            expect(tvShows).to(haveCount(20))
        }
        
        it("gets popular movies") {
            let movieRepositoryApi = MovieRepositoryApi()

            let movies = try self.awaitPublisher(movieRepositoryApi.getPopularMovies())

            expect(movies).to(haveCount(20))
        }
    }
}
