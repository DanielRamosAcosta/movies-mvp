//
//  HomePresenter.swift
//  Cineni
//
//  Created by Daniel Ramos on 22/8/22.
//

import Foundation

protocol HomeViewDelegate: AnyObject {
    func presentTrendingMovies(_ movies: [Movie])
    func presentTrendingTVShows(_ tvShows: [TVShow])
    func presentPopularMovies(_ movies: [Movie])
    func presentUpcomingMovies(_ movies: [Movie])
}
