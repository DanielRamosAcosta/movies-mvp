//
//  MovieRepositoryFake.swift
//  Cineni
//
//  Created by Daniel Ramos on 22/8/22.
//

import Combine
import Foundation
import Swinject

class MovieRepositoryFake: MovieRepository {
    public static func build(_: Resolver) -> MovieRepositoryFake {
        return MovieRepositoryFake()
    }

    func getTrendingMovies() -> AnyPublisher<[Movie], Error> {
        let movies: [Movie] = [
            Movie(title: "Vengeance", posterPath: "/pdQFGAX68LWoiBqzXwZhMRaraC0.jpg"),
        ]

        return Just(movies)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    func getTrendingTVShows() -> AnyPublisher<[TVShow], Error> {
        let tvShows: [TVShow] = [
            TVShow(title: "She-Hulk: Attorney at Law", posterPath: "/zNKVhijwhmkcMcgonCQ2yHLc7Ca.jpg"),
        ]

        return Just(tvShows)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func getPopularMovies() -> AnyPublisher<[Movie], Error> {
        let movies: [Movie] = [
            Movie(title: "Dragon Ball Super: Super Hero", posterPath: "/rugyJdeoJm7cSJL1q4jBpTNbxyU.jpg")
        ]

        return Just(movies).setFailureType(to: Error.self).eraseToAnyPublisher()
    }

    private let simulateErrors: Bool

    init(simulateErrors: Bool = false) {
        self.simulateErrors = simulateErrors
    }
}
