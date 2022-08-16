//
//  GetMovieList.swift
//  Cineni
//
//  Created by Daniel Ramos on 12/8/22.
//

import Combine
import Foundation

class GetMovieList {
    private let movieRepository: MovieRepository

    init(_ movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }

    public func execute() -> AnyPublisher<[Movie], Error> {
        return movieRepository.getMovies()
    }
}
