//
//  GetMovieList.swift
//  Cineni
//
//  Created by Daniel Ramos on 12/8/22.
//

import Combine
import Foundation

class HomeUseCases {
    private let movieRepository: MovieRepository

    init(_ movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }

    public func getTrendingMovies() -> AnyPublisher<[Movie], Error> {
        return movieRepository.getTrending()
    }
}
