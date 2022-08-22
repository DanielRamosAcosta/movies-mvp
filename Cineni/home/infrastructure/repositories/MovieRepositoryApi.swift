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

    func getTrending() -> AnyPublisher<[MovieDomain], Error> {
        return client.getTrending()
            .map { $0.map { MovieDomain(title: $0.title, posterPath: $0.poster_path) } }
            .eraseToAnyPublisher()
    }
}
