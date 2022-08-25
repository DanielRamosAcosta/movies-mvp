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
    private let tvShowRepository: TVShowRepository

    public static func build(_ resolver: Resolver) -> HomeUseCases {
        return HomeUseCases(
            movieRepository: resolver.resolve(MovieRepository.self)!,
            tvShowRepository: resolver.resolve(TVShowRepository.self)!
        )
    }

    init(movieRepository: MovieRepository, tvShowRepository: TVShowRepository) {
        self.movieRepository = movieRepository
        self.tvShowRepository = tvShowRepository
    }

    func getTrendingMovies() -> AnyPublisher<[Movie], Error> {
        return movieRepository.getTrending()
    }

    func getTrendingTVShows() -> AnyPublisher<[TVShow], Error> {
        return tvShowRepository.getTrendingTVShows()
    }

    func getPopularMovies() -> AnyPublisher<[Movie], Error> {
        return movieRepository.getPopularMovies()
    }

    func getUpcomingMovies() -> AnyPublisher<[Movie], Error> {
        return movieRepository.getUpcomingMovies()
    }

    func getTopRatedMovies() -> AnyPublisher<[Movie], Error> {
        return movieRepository.getTopRated()
    }
}
