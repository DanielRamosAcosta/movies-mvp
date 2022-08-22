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
    func getTrending() -> AnyPublisher<[MovieDomain], Error>
}

enum MovieRepositoryError: Error {
    case apiNotReachable
}
