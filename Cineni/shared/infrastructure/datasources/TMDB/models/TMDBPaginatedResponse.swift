//
//  TMDBPaginatedResponse.swift
//  Cineni
//
//  Created by Daniel Ramos on 22/8/22.
//

import Foundation

struct TMDBPaginatedResponse: Codable {
    let results: [TMDBContent]
}

