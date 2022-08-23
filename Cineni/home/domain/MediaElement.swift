//
//  File.swift
//  Cineni
//
//  Created by Daniel Ramos on 23/8/22.
//

import Foundation

class MediaElement {
    private let title: String
    private let posterPath: String

    init(title: String, posterPath: String) {
        self.title = title
        self.posterPath = posterPath
    }

    public func getThumbnailUrl() -> String {
        return "https://image.tmdb.org/t/p/w500\(posterPath)"
    }

    public func getTitle() -> String {
        return title
    }
}
