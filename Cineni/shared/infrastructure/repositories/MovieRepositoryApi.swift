//
//  MovieRepositoryApi.swift
//  Cineni
//
//  Created by Daniel Ramos on 22/8/22.
//

import Combine
import Swinject

class MovieRepositoryApi: MovieRepository {
    private let client = TMDBClient()

    public static func build(_: Resolver) -> MovieRepositoryApi {
        return MovieRepositoryApi()
    }

    func getTrending() -> AnyPublisher<[Movie], Error> {
        return client.getTrendingMovies()
            .map { $0.results }
            .map { $0.map { Movie(title: $0.title, posterPath: $0.posterPath) } }
            .eraseToAnyPublisher()
    }

    func getPopularMovies() -> AnyPublisher<[Movie], Error> {
        return client.getPopularMovies()
            .map { $0.results }
            .map { $0.map { Movie(title: $0.title, posterPath: $0.posterPath) } }
            .eraseToAnyPublisher()
    }

    func getUpcomingMovies() -> AnyPublisher<[Movie], Error> {
        return client.getUpcomingMovies()
            .map { $0.results }
            .map { $0.map { Movie(title: $0.title, posterPath: $0.posterPath) } }
            .eraseToAnyPublisher()
    }

    func getTopRated() -> AnyPublisher<[Movie], Error> {
        return client.getTopRatedMovies()
            .map { $0.results }
            .map { $0.map { Movie(title: $0.title, posterPath: $0.posterPath) } }
            .eraseToAnyPublisher()
    }
}
