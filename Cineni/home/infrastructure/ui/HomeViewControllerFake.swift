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

    public static func build(_: Resolver) -> HomeViewControllerFake {
        return HomeViewControllerFake()
    }

    func presentTrendingMovies(_ movies: [Movie]) {
        trendingMovies = movies
    }
}
