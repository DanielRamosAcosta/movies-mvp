//
//  SearchPresenter.swift
//  Cineni
//
//  Created by Daniel Ramos on 25/8/22.
//

import Combine
import Swinject

class SearchPresenter {
    private weak var view: SearchViewDelegate?
    let useCases: SearchUseCases
    private var cancellable1: AnyCancellable?
    private var cancellable2: AnyCancellable?
    private var querySubject = PassthroughSubject<String, Error>()

    public static func build(_ resolver: Resolver) -> SearchPresenter {
        let delegate = resolver.resolve(SearchViewDelegate.self)!
        let useCases = resolver.resolve(SearchUseCases.self)!
        return SearchPresenter(delegate: delegate, useCases: useCases)
    }

    init(delegate: SearchViewDelegate?, useCases: SearchUseCases) {
        view = delegate
        self.useCases = useCases

        cancellable2 = useCases.createPublisher(setup: querySubject)
            .catch { error -> AnyPublisher<[Movie], Never> in
                print("This is the error \(error)")
                return Empty(completeImmediately: true).eraseToAnyPublisher()
            }
            .sink(
                receiveValue: { [weak self] movies in
                    self?.view?.presentSearchResults(movies)
                }
            )
    }

    func loadTopSearchedMovies() {
        cancellable1 = useCases.getTopSearchedMovies()
            .catch { error -> AnyPublisher<[Movie], Never> in
                print("This is the error \(error)")
                return Empty(completeImmediately: true).eraseToAnyPublisher()
            }
            .sink(
                receiveValue: { [weak self] movies in
                    self?.view?.presentTopSearchedMovies(movies)
                }
            )
    }

    func loadSearch(query: String) {
        querySubject.send(query)
    }
}
