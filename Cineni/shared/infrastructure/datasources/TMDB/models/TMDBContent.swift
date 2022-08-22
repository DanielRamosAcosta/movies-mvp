//
//  TMDBContent.swift
//  Cineni
//
//  Created by Daniel Ramos on 22/8/22.
//

import Foundation

enum TMDBContent {
    case movie(TMDBMovie)
    case tvShow(TMDBTVShow)
}

extension TMDBContent: Codable {
    private enum CodingKeys: String, CodingKey {
        // swiftlint:disable identifier_name
        case media_type
        // swiftlint:enable identifier_name
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let singleContainer = try decoder.singleValueContainer()

        let type = try container.decode(String.self, forKey: .media_type)
        switch type {
        case "movie":
            let movie = try singleContainer.decode(TMDBMovie.self)
            self = .movie(movie)
        case "tv":
            let tvShow = try singleContainer.decode(TMDBTVShow.self)
            self = .tvShow(tvShow)
        default:
            fatalError("Unknown type of content.")
            // or handle this case properly
        }
    }

    func encode(to encoder: Encoder) throws {
        var singleContainer = encoder.singleValueContainer()

        switch self {
        case let .movie(movie):
            try singleContainer.encode(movie)
        case let .tvShow(tvShow):
            try singleContainer.encode(tvShow)
        }
    }
}
