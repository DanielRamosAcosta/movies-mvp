//
//  TMDBPaginatedResponse.swift
//  Cineni
//
//  Created by Daniel Ramos on 22/8/22.
//

import Foundation

struct TMDBPaginatedResponse<T: Codable>: Codable {
    let results: [T]
}
