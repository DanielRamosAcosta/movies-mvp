//
//  SearchUseCases.swift
//  Cineni
//
//  Created by Daniel Ramos on 25/8/22.
//

import Combine
import Foundation
import Swinject

class SearchUseCases {
    private let movieRepository: MovieRepository

    public static func build(_ resolver: Resolver) -> SearchUseCases {
        return SearchUseCases(
            movieRepository: resolver.resolve(MovieRepository.self)!
        )
    }

    init(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }

    func createPublisher(setup: PassthroughSubject<String, Error>) -> AnyPublisher<[Movie], Error> {
        return setup
            .filter { $0.count > 3 }
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .flatMap { self.movieRepository.search(query: $0) }
            .eraseToAnyPublisher()
    }

    func getTopSearchedMovies() -> AnyPublisher<[Movie], Error> {
        return movieRepository.getTopSearched()
    }
}
