//
//  TVShowRepository.swift
//  Cineni
//
//  Created by Daniel Ramos on 25/8/22.
//

import Combine
import Swinject

protocol TVShowRepository {
    func getTrendingTVShows() -> AnyPublisher<[TVShow], Error>
}

enum TVShowRepositoryError: Error {
    case apiNotReachable
}
