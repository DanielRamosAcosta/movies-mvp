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
    func getPopular() -> AnyPublisher<[Movie], Error>
    func getUpcoming() -> AnyPublisher<[Movie], Error>
    func getTopRated() -> AnyPublisher<[Movie], Error>
    func getTopSearched() -> AnyPublisher<[Movie], Error>
    func search(query: String) -> AnyPublisher<[Movie], Error>
}

enum MovieRepositoryError: Error {
    case apiNotReachable
}
