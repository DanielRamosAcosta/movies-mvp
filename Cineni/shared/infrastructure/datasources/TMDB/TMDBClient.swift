//
//  TMDBClient.swift
//  Cineni
//
//  Created by Daniel Ramos on 22/8/22.
//

import Combine
import Foundation

struct Constants {
    static let API_KEY = "486d343f9b5ccc40cd5650b69fc70c5e"
    static let baseUrl = "https://api.themoviedb.org"
}

class TMDBClient {
    func createUrl() -> URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.themoviedb.org"
        components.path = "/3/trending/all/day"
        components.queryItems = [
            URLQueryItem(name: "api_key", value: Constants.API_KEY),
        ]
        return components
    }

    func getTrending() -> AnyPublisher<[TMDBMovie], Error> {
        guard let url = createUrl().url else {
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
            .map { data -> [TMDBMovie] in
                print("decoded!")

                let onlyMovies = data.results.compactMap { content -> TMDBMovie? in
                    switch content {
                    case let .movie(movie):
                        return movie
                    case .tvShow:
                        return nil
                    }
                }

                let movies: [TMDBMovie] = onlyMovies

                return movies
            }
            .eraseToAnyPublisher()
    }
}
