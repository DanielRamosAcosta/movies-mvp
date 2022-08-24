//
//  MovieRepositoryApi.swift
//  Cineni
//
//  Created by Daniel Ramos on 22/8/22.
//

import Combine
import Foundation
import Swinject

class MovieRepositoryApi: MovieRepository {
    private let client = TMDBClient()

    public static func build(_: Resolver) -> MovieRepositoryApi {
        return MovieRepositoryApi()
    }

    func getTrendingMovies() -> AnyPublisher<[Movie], Error> {
        return client.getTrendingMovies()
            .map { $0.results }
            .map { $0.map { Movie(title: $0.title, posterPath: $0.posterPath) } }
            .eraseToAnyPublisher()
    }

    func getTrendingTVShows() -> AnyPublisher<[TVShow], Error> {
        return client.getTrendingTVShows()
            .map { $0.results }
            .map { $0.map { TVShow(title: $0.name, posterPath: $0.posterPath) } }
            .eraseToAnyPublisher()
    }
    
    func getPopularMovies() -> AnyPublisher<[Movie], Error> {
        return client.getPopularMovies()
            .map { $0.results }
            .map { $0.map { Movie(title: $0.title, posterPath: $0.posterPath) } }
            .eraseToAnyPublisher()
    }
}
