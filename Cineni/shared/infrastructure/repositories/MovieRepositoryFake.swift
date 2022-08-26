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

    func getTopSearched() -> AnyPublisher<[Movie], Error> {
        let movies = [
            Movie(title: vengeance.title, posterPath: vengeance.posterPath),
            Movie(title: dragonBall.title, posterPath: dragonBall.posterPath),
            Movie(title: theBlackPhone.title, posterPath: theBlackPhone.posterPath),
        ]

        return Just(movies).setFailureType(to: Error.self).eraseToAnyPublisher()
    }

    func search(query: String) -> AnyPublisher<[Movie], Error> {
        let movies = [
            vengeance,
            dragonBall,
            theBlackPhone,
            memento,
        ]

        let result = movies
            .filter { movie in
                movie.title.contains(query)
            }
            .map { fixture in
                Movie(title: fixture.title, posterPath: fixture.posterPath)
            }

        return Just(result).setFailureType(to: Error.self).eraseToAnyPublisher()
    }
}
