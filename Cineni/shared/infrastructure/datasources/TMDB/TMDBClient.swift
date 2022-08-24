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

class TMDBClient {
    func getUrlForPath(_ path: String) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.themoviedb.org"
        components.path = path
        components.queryItems = [
            URLQueryItem(name: "api_key", value: Constants.apiKey),
        ]
        return components.url
    }

    func getTrendingMovies() -> AnyPublisher<TMDBPaginatedResponse<TMDBMovie>, Error> {
        return getUrlForPath("/3/trending/movie/day")
            .publisher
            .flatMap { URLSession.shared.dataTaskPublisher(for: $0) }
            .tryMap(mapErrors)
            .decode(type: TMDBPaginatedResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

    func getTrendingTVShows() -> AnyPublisher<TMDBPaginatedResponse<TMDBTVShow>, Error> {
        return getUrlForPath("/3/trending/tv/day")
            .publisher
            .flatMap { URLSession.shared.dataTaskPublisher(for: $0) }
            .tryMap(mapErrors)
            .decode(type: TMDBPaginatedResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func getPopularMovies() -> AnyPublisher<TMDBPaginatedResponse<TMDBMoviePopular>, Error> {
        return getUrlForPath("/3/movie/popular")
            .publisher
            .flatMap { URLSession.shared.dataTaskPublisher(for: $0) }
            .tryMap(mapErrors)
            .decode(type: TMDBPaginatedResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

    private func mapErrors(element: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let httpResponse = element.response as? HTTPURLResponse,
              httpResponse.statusCode == 200
        else {
            throw URLError(.badServerResponse)
        }
        return element.data
    }
}
