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
        it("gets trending tv shows") {
            let movieRepositoryApi = MovieRepositoryApi()

            let movies = try self.awaitPublisher(movieRepositoryApi.getTrendingTVShows())

            expect(movies).to(haveCount(20))
        }
    }
}
