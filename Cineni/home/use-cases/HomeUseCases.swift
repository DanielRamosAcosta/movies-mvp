//
//  GetMovieList.swift
//  Cineni
//
//  Created by Daniel Ramos on 12/8/22.
//

import Combine
import Foundation
import Swinject

class HomeUseCases {
    private let movieRepository: MovieRepository

    public static func build(_ resolver: Resolver) -> HomeUseCases {
        return HomeUseCases(resolver.resolve(MovieRepository.self)!)
    }

    init(_ movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }

    public func getTrendingMovies() -> AnyPublisher<[MovieDomain], Error> {
        return movieRepository.getTrending()
    }
}
