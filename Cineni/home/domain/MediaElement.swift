//
//  File.swift
//  Cineni
//
//  Created by Daniel Ramos on 23/8/22.
//

import Foundation

class MediaElement {
    private let title: String
    private let posterPath: String?
    private static let posterFallBack = "/aHTUpo45qy9QYIOnVITGGqLoVcA.jpg"

    init(title: String, posterPath: String?) {
        self.title = title
        self.posterPath = posterPath
    }

    public func getThumbnailUrl() -> String {
        return "https://image.tmdb.org/t/p/w500\(posterPath ?? MediaElement.posterFallBack)"
    }

    public func getTitle() -> String {
        return title
    }
}
