//
//  Movie.swift
//  Cineni
//
//  Created by Daniel Ramos on 12/8/22.
//

import Foundation

struct MovieOld: Codable {
    let name: String
}


struct MovieDBPagiantedResponse: Codable {
    let results: [MovieDBContent]
}

enum MovieDBContent {
    case movie(Movie)
    case tvShow(TVShow)
}

extension MovieDBContent: Codable {
    private enum CodingKeys: String, CodingKey {
        case media_type = "media_type"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let singleContainer = try decoder.singleValueContainer()
        
        let type = try container.decode(String.self, forKey: .media_type)
        switch type {
        case "movie":
            let movie = try singleContainer.decode(Movie.self)
            self = .movie(movie)
        case "tv":
            let tvShow = try singleContainer.decode(TVShow.self)
            self = .tvShow(tvShow)
        default:
            fatalError("Unknown type of content.")
            // or handle this case properly
        }
    }
        
    func encode(to encoder: Encoder) throws {
        var singleContainer = encoder.singleValueContainer()
        
        switch self {
            case .movie(let movie):
                try singleContainer.encode(movie)
            case .tvShow(let tvShow):
                try singleContainer.encode(tvShow)
        }
    }
}

struct Movie: Codable {
    let adult: Bool
    let backdrop_path: String
    let id: Int
    let title: String
    let original_language: String
    let original_title: String
    let overview: String
    let poster_path: String
    let media_type: String
    let genre_ids: [Int]
    let popularity: Double
    let release_date: String
    let video: Bool
    let vote_average: Double
    let vote_count: Int
}

struct TVShow: Codable {
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
}

