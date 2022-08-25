//
//  HomeViewControllerFake.swift
//  Cineni
//
//  Created by Daniel Ramos on 23/8/22.
//

import Foundation
import Swinject

class HomeViewControllerFake: HomeViewDelegate {
    public var trendingMovies: [Movie] = []
    public var trendingTVShows: [TVShow] = []
    public var popularMovies: [Movie] = []
    public var upcomingMovies: [Movie] = []
    public var topRatedMovies: [Movie] = []

    public static func build(_: Resolver) -> HomeViewControllerFake {
        return HomeViewControllerFake()
    }

    func presentTrendingMovies(_ movies: [Movie]) {
        trendingMovies = movies
    }

    func presentTrendingTVShows(_ tvShows: [TVShow]) {
        trendingTVShows = tvShows
    }

    func presentPopularMovies(_ movies: [Movie]) {
        popularMovies = movies
    }

    func presentUpcomingMovies(_ movies: [Movie]) {
        upcomingMovies = movies
    }

    func presentTopRatedMovies(_ movies: [Movie]) {
        topRatedMovies = movies
    }
}
