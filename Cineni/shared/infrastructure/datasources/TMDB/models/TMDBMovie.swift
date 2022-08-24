//
//  TMDBMovie.swift
//  Cineni
//
//  Created by Daniel Ramos on 22/8/22.
//

import Foundation

struct TMDBMovie: Codable {
    let adult: Bool
    let backdropPath: String
    let id: Int
    let title: String
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let posterPath: String
    let mediaType: String
    let genreIds: [Int]
    let popularity: Double
    let releaseDate: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    private enum CodingKeys: String, CodingKey {
        case
            adult,
            backdropPath = "backdrop_path",
            id,
            title,
            originalLanguage = "original_language",
            originalTitle = "original_title",
            overview,
            posterPath = "poster_path",
            mediaType = "media_type",
            genreIds = "genre_ids",
            popularity,
            releaseDate = "release_date",
            video,
            voteAverage = "vote_average",
            voteCount = "vote_count"
    }
}

struct TMDBMoviePopular: Codable {
    let adult: Bool
    let backdropPath: String
    let id: Int
    let title: String
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let posterPath: String
    let genreIds: [Int]
    let popularity: Double
    let releaseDate: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    private enum CodingKeys: String, CodingKey {
        case
            adult,
            backdropPath = "backdrop_path",
            id,
            title,
            originalLanguage = "original_language",
            originalTitle = "original_title",
            overview,
            posterPath = "poster_path",
            genreIds = "genre_ids",
            popularity,
            releaseDate = "release_date",
            video,
            voteAverage = "vote_average",
            voteCount = "vote_count"
    }
}
