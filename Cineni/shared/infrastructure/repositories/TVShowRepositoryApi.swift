//
//  TVShowRepositoryApi.swift
//  Cineni
//
//  Created by Daniel Ramos on 25/8/22.
//

import Foundation

import Combine
import Swinject

class TVShowRepositoryApi: TVShowRepository {
    private let client = TMDBClient()

    public static func build(_: Resolver) -> TVShowRepositoryApi {
        return TVShowRepositoryApi()
    }

    func getTrendingTVShows() -> AnyPublisher<[TVShow], Error> {
        return client.getTrendingTVShows()
            .map { $0.results }
            .map { $0.map { TVShow(title: $0.name, posterPath: $0.posterPath) } }
            .eraseToAnyPublisher()
    }
}
