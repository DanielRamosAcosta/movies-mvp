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
        return client.getTrending(content: .movie)
            .map { data -> [TMDBMovie] in
                data.results.compactMap { content -> TMDBMovie? in
                    switch content {
                    case let .movie(movie):
                        return movie
                    case .tvShow:
                        return nil
                    }
                }
            }
            .map { $0.map { Movie(title: $0.title, posterPath: $0.posterPath) } }
            .eraseToAnyPublisher()
    }

    func getTrendingTVShows() -> AnyPublisher<[TVShow], Error> {
        return client.getTrending(content: .tvShow)
            .map { data -> [TMDBTVShow] in
                data.results.compactMap { content -> TMDBTVShow? in
                    switch content {
                    case let .tvShow(tvShow):
                        return tvShow
                    case .movie:
                        return nil
                    }
                }
            }
            .map { $0.map { TVShow(title: $0.name, posterPath: $0.posterPath) } }
            .eraseToAnyPublisher()
    }
}
