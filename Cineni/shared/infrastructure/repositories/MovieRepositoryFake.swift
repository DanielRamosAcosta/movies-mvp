//
//  MovieRepositoryFake.swift
//  Cineni
//
//  Created by Daniel Ramos on 22/8/22.
//

import Combine
import Swinject

class MovieRepositoryFake: MovieRepository {
    public static func build(_: Resolver) -> MovieRepositoryFake {
        return MovieRepositoryFake()
    }

    func getTrending() -> AnyPublisher<[Movie], Error> {
        let movies: [Movie] = [
            Movie(title: vengeance.title, posterPath: vengeance.posterPath),
        ]

        return Just(movies)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    func getPopular() -> AnyPublisher<[Movie], Error> {
        let movies: [Movie] = [
            Movie(title: dragonBall.title, posterPath: dragonBall.posterPath),
        ]

        return Just(movies).setFailureType(to: Error.self).eraseToAnyPublisher()
    }

    func getUpcoming() -> AnyPublisher<[Movie], Error> {
        let movies = [
            Movie(title: theBlackPhone.title, posterPath: theBlackPhone.posterPath),
        ]

        return Just(movies).setFailureType(to: Error.self).eraseToAnyPublisher()
    }

    func getTopRated() -> AnyPublisher<[Movie], Error> {
        let movies = [Movie(title: theShawshankRedemption.title, posterPath: theShawshankRedemption.posterPath)]

        return Just(movies).setFailureType(to: Error.self).eraseToAnyPublisher()
    }
}
