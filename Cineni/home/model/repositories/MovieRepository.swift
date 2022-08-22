//
//  MovieRepository.swift
//  Cineni
//
//  Created by Daniel Ramos on 12/8/22.
//

import Combine
import Foundation

protocol MovieRepository {
    func getMovies() -> AnyPublisher<[MovieOld], Error>
    func getTrending() -> AnyPublisher<[Movie], Error>
}

struct Constants {
    static let API_KEY = "486d343f9b5ccc40cd5650b69fc70c5e"
    static let baseUrl = "https://api.themoviedb.org"
}

class MovieRepositoryApi: MovieRepository {
    func getTrending() -> AnyPublisher<[Movie], Error> {
        let url = URL(string: "\(Constants.baseUrl)/3/trending/all/day?api_key=\(Constants.API_KEY)")
        
        guard let urll = url else {
            return Empty(completeImmediately: true).eraseToAnyPublisher()
        }

        print("before")

        return URLSession.shared.dataTaskPublisher(for: urll)
            .tryMap { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                      httpResponse.statusCode == 200
                else {
                    throw URLError(.badServerResponse)
                }
                return element.data
            }
            .decode(type: MovieDBPagiantedResponse.self, decoder: JSONDecoder())
            .map { data in
                print("decoded!")
                
                let onlyMovies = data.results.compactMap { content -> Movie? in
                    switch content {
                    case .movie(let movie):
                        return movie
                    case .tvShow:
                        return nil
                    }
                }
                
                let movies: [Movie] = onlyMovies

                return movies
            }
            .eraseToAnyPublisher()
    }
    
    func getMovies() -> AnyPublisher<[MovieOld], Error> {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")

        guard let urll = url else {
            return Empty(completeImmediately: true).eraseToAnyPublisher()
        }

        print("before")

        return URLSession.shared.dataTaskPublisher(for: urll)
            .tryMap { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                      httpResponse.statusCode == 200
                else {
                    throw URLError(.badServerResponse)
                }
                return element.data
            }
            .decode(type: [MovieOld].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

enum MovieRepositoryError: Error {
    case apiNotReachable
}

class MovieRepositoryFake: MovieRepository {
    func getTrending() -> AnyPublisher<[Movie], Error> {
        let movies: [Movie] = [
            Movie(
                adult: false,
                backdrop_path: "/jwFBzWabfWpnN9P5YIVVX5W8WUY.jpg",
                id: 683340,
                title: "Vengeance",
                original_language: "en",
                original_title: "Vengeance",
                overview: "Ben Manalowitz, a journalist and podcaster, travels from New York City to West Texas to investigate the death of a girl he was hooking up with.",
                poster_path: "/pdQFGAX68LWoiBqzXwZhMRaraC0.jpg",
                media_type: "movie",
                genre_ids: [53, 18, 9648],
                popularity: 27.896,
                release_date: "2022-07-29",
                video: false,
                vote_average: 7.32,
                vote_count: 25
            )
        ]

        return Just(movies)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    private let simulateErrors: Bool

    init(simulateErrors: Bool = false) {
        self.simulateErrors = simulateErrors
    }

    func getMovies() -> AnyPublisher<[MovieOld], Error> {
        if simulateErrors {
            print("simulating an error")
            return Fail(error: MovieRepositoryError.apiNotReachable).eraseToAnyPublisher()
        } else {
            print("not simulating an error")
        }

        let movies: [MovieOld] = [
            MovieOld(name: "Day Shift"),
            MovieOld(name: "Prey"),
            MovieOld(name: "Elvis"),
            MovieOld(name: "Secret Headquarters"),
            MovieOld(name: "Minions: The Rise of Gru"),
            MovieOld(name: "Westworld"),
            MovieOld(name: "Better Call Saul"),
            MovieOld(name: "Sandman"),
        ]

        return Just(movies)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
