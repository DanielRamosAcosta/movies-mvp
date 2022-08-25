//
//  TVShowRepositoryFake.swift
//  Cineni
//
//  Created by Daniel Ramos on 25/8/22.
//

import Combine
import Swinject

class TVShowRepositoryFake: TVShowRepository {
    public static func build(_: Resolver) -> TVShowRepositoryFake {
        return TVShowRepositoryFake()
    }

    func getTrendingTVShows() -> AnyPublisher<[TVShow], Error> {
        let tvShows: [TVShow] = [
            TVShow(title: sheHulk.title, posterPath: sheHulk.posterPath),
        ]

        return Just(tvShows)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
