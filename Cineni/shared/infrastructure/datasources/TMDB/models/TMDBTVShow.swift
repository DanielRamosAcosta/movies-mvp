//
//  TMDBTVShow.swift
//  Cineni
//
//  Created by Daniel Ramos on 22/8/22.
//

import Foundation

struct TMDBTVShow: Codable {
    // swiftlint:disable identifier_name
    let adult: Bool
    let backdrop_path: String
    let id: Int
    let name: String
    let original_language: String
    let original_name: String
    let overview: String
    let poster_path: String
    let media_type: String
    let genre_ids: [Int]
    let popularity: Double
    let first_air_date: String
    let vote_average: Double
    let vote_count: Int
    let origin_country: [String]
    // swiftlint:enable identifier_name
}
