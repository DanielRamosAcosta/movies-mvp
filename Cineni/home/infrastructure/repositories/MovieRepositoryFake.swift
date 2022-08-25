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
            Movie(title: vengeance.title, posterPath: vengeance.posterPath),
        ]

        return Just(movies)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    func getTrendingTVShows() -> AnyPublisher<[TVShow], Error> {
        let tvShows: [TVShow] = [
            TVShow(title: sheHulk.title, posterPath: sheHulk.posterPath),
        ]

        return Just(tvShows)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    func getPopularMovies() -> AnyPublisher<[Movie], Error> {
        let movies: [Movie] = [
            Movie(title: dragonBall.title, posterPath: dragonBall.posterPath),
        ]

        return Just(movies).setFailureType(to: Error.self).eraseToAnyPublisher()
    }

    func getUpcomingMovies() -> AnyPublisher<[Movie], Error> {
        let movies = [
            Movie(title: theBlackPhone.title, posterPath: theBlackPhone.posterPath),
        ]

        return Just(movies).setFailureType(to: Error.self).eraseToAnyPublisher()
    }

    func getTopRatedMovies() -> AnyPublisher<[Movie], Error> {
        let movies = [Movie(title: theShawshankRedemption.title, posterPath: theShawshankRedemption.posterPath)]

        return Just(movies).setFailureType(to: Error.self).eraseToAnyPublisher()
    }

    private let simulateErrors: Bool

    init(simulateErrors: Bool = false) {
        self.simulateErrors = simulateErrors
    }
}
