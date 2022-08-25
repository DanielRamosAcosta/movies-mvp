//
//  UpcomingUseCases.swift
//  Cineni
//
//  Created by Daniel Ramos on 25/8/22.
//

import Combine
import Foundation
import Swinject

class UpcomingUseCases {
    private let movieRepository: MovieRepository

    public static func build(_ resolver: Resolver) -> UpcomingUseCases {
        return UpcomingUseCases(
            movieRepository: resolver.resolve(MovieRepository.self)!
        )
    }

    init(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }

    func getUpcomingMovies() -> AnyPublisher<[Movie], Error> {
        return movieRepository.getUpcoming()
    }
}
