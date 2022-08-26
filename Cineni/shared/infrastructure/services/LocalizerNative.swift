//
//  LocalizerNative.swift
//  Cineni
//
//  Created by Daniel Ramos on 26/8/22.
//

import Foundation
import Swinject

class LocalizerNative: Localizer {
    public static func build(_: Resolver) -> LocalizerNative {
        return LocalizerNative()
    }

    static func toLocalKey(_ key: LocalKeys) -> String {
        switch key {
        case .trendingMovies: return "trendingMovies"
        case .trendingTvShows: return "trendingTVShows"
        case .search: return "search"
        }
    }

    func translate(_ key: LocalKeys) -> String {
        let localKey = LocalizerNative.toLocalKey(key)

        return NSLocalizedString(localKey, comment: "")
    }
}
