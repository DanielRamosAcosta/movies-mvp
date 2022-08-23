//
//  TMDBTVShow.swift
//  Cineni
//
//  Created by Daniel Ramos on 22/8/22.
//

import Foundation

struct TMDBTVShow: Codable {
    let adult: Bool
    let backdropPath: String
    let id: Int
    let name: String
    let originalLanguage: String
    let originalName: String
    let overview: String
    let posterPath: String
    let mediaType: String
    let genreIds: [Int]
    let popularity: Double
    let firstAirDate: String
    let voteAverage: Double
    let voteCount: Int
    let originCountry: [String]

    private enum CodingKeys: String, CodingKey {
        case
            adult,
            backdropPath = "backdrop_path",
            id,
            name,
            originalLanguage = "original_language",
            originalName = "original_name",
            overview,
            posterPath = "poster_path",
            mediaType = "media_type",
            genreIds = "genre_ids",
            popularity,
            firstAirDate = "first_air_date",
            voteAverage = "vote_average",
            voteCount = "vote_count",
            originCountry = "origin_country"
    }
}
