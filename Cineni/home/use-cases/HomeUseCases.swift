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

    func getTrendingMovies() -> AnyPublisher<[Movie], Error> {
        return movieRepository.getTrendingMovies()
    }

    func getTrendingTVShows() -> AnyPublisher<[TVShow], Error> {
        return movieRepository.getTrendingTVShows()
    }

    func getPopularMovies() -> AnyPublisher<[Movie], Error> {
        return movieRepository.getPopularMovies()
    }

    func getUpcomingMovies() -> AnyPublisher<[Movie], Error> {
        return movieRepository.getUpcomingMovies()
    }
}
