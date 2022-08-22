//
//  MovieRepositoryFake.swift
//  Cineni
//
//  Created by Daniel Ramos on 22/8/22.
//

import Foundation
import Combine
import Swinject

class MovieRepositoryFake: MovieRepository {
    public static func build(_ resolver: Resolver) -> MovieRepositoryFake {
        return MovieRepositoryFake()
    }
    
    func getTrending() -> AnyPublisher<[MovieDomain], Error> {
        let movies: [MovieDomain] = [
            MovieDomain(title: "Vengeance", posterPath: "/jwFBzWabfWpnN9P5YIVVX5W8WUY.jpg")
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
