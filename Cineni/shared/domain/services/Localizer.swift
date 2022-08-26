//
//  Localizer.swift
//  Cineni
//
//  Created by Daniel Ramos on 26/8/22.
//

import Foundation

enum LocalKeys {
    case trendingMovies
    case trendingTvShows
    case search
}

protocol Localizer {
    func  translate(_ key: LocalKeys) -> String
}
