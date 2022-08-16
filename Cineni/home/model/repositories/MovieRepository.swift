//
//  MovieRepository.swift
//  Cineni
//
//  Created by Daniel Ramos on 12/8/22.
//

import Foundation
import Combine

protocol MovieRepository {
    func getMovies() -> AnyPublisher<[Movie], Error>
}

class MovieRepositoryApi: MovieRepository {
    func getMovies() -> AnyPublisher<[Movie], Error> {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")
        
        guard let urll = url else {
            return Empty(completeImmediately: true).eraseToAnyPublisher()
        }

        print("before")

        return URLSession.shared.dataTaskPublisher(for: urll)
            .tryMap{ element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                          throw URLError(.badServerResponse)
                      }
                return element.data
            }
            .decode(type: [Movie].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

enum MovieRepositoryError: Error {
    case apiNotReachable
}

class MovieRepositoryFake: MovieRepository {
    private let simulateErrors: Bool
    
    init(simulateErrors: Bool = false) {
        self.simulateErrors = simulateErrors
    }
    
    func getMovies() -> AnyPublisher<[Movie], Error> {
        if(simulateErrors) {
            print("simulating an error")
            return Fail(error: MovieRepositoryError.apiNotReachable).eraseToAnyPublisher()
        } else {
            print("not simulating an error")
        }
        
        
        let movies: [Movie] = [
            Movie(name: "Day Shift"),
            Movie(name: "Prey"),
            Movie(name: "Elvis"),
            Movie(name: "Secret Headquarters"),
            Movie(name: "Minions: The Rise of Gru"),
            Movie(name: "Westworld"),
            Movie(name: "Better Call Saul"),
            Movie(name: "Sandman"),
        ]
        
        return Just(movies)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
