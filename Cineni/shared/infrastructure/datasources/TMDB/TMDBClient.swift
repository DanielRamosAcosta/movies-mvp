//
//  TMDBClient.swift
//  Cineni
//
//  Created by Daniel Ramos on 22/8/22.
//

import Combine
import Foundation

struct Constants {
    static let apiKey = "486d343f9b5ccc40cd5650b69fc70c5e"
}

enum TMDBContentType: String {
    case all
    case movie
}

class TMDBClient {
    func getTrendingUrl(_ type: TMDBContentType) -> URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.themoviedb.org"
        components.path = "/3/trending/\(type.rawValue)/day"
        components.queryItems = [
            URLQueryItem(name: "api_key", value: Constants.apiKey),
        ]
        return components
    }

    func getTrending(content: TMDBContentType) -> AnyPublisher<TMDBPaginatedResponse, Error> {
        guard let url = getTrendingUrl(content).url else {
            return Empty(completeImmediately: true).eraseToAnyPublisher()
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                      httpResponse.statusCode == 200
                else {
                    throw URLError(.badServerResponse)
                }
                return element.data
            }
            .decode(type: TMDBPaginatedResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
