//
//  MovieRepository.swift
//  Cineni
//
//  Created by Daniel Ramos on 12/8/22.
//

import Combine
import Foundation
import Swinject

protocol MovieRepository {
    func getTrendingMovies() -> AnyPublisher<[Movie], Error>
    func getTrendingTVShows() -> AnyPublisher<[TVShow], Error>
    func getPopularMovies() -> AnyPublisher<[Movie], Error>
    func getUpcomingMovies() -> AnyPublisher<[Movie], Error>
}

enum MovieRepositoryError: Error {
    case apiNotReachable
}
