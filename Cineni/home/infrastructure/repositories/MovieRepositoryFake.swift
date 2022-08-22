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

    func getTrending() -> AnyPublisher<[MovieDomain], Error> {
        let movies: [MovieDomain] = [
            MovieDomain(title: "Vengeance", posterPath: "/jwFBzWabfWpnN9P5YIVVX5W8WUY.jpg"),
        ]

        return Just(movies)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    private let simulateErrors: Bool

    init(simulateErrors: Bool = false) {
        self.simulateErrors = simulateErrors
    }
}
