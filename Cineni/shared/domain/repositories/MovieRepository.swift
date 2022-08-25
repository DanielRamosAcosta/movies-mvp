//
//  MovieRepository.swift
//  Cineni
//
//  Created by Daniel Ramos on 12/8/22.
//

import Combine
import Swinject

protocol MovieRepository {
    func getTrending() -> AnyPublisher<[Movie], Error>
    func getPopularMovies() -> AnyPublisher<[Movie], Error>
    func getUpcomingMovies() -> AnyPublisher<[Movie], Error>
    func getTopRated() -> AnyPublisher<[Movie], Error>
}

enum MovieRepositoryError: Error {
    case apiNotReachable
}
