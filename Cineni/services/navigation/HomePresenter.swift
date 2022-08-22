//
//  HomePresenter.swift
//  Cineni
//
//  Created by Daniel Ramos on 22/8/22.
//

import Foundation
import Combine

class HomePresenter {
    private weak var homeView: HomeViewDelegate?
    let homeUseCases: HomeUseCases
    private var cancellable: AnyCancellable?

    init(delegate: HomeViewDelegate?, homeUseCases: HomeUseCases) {
        homeView = delegate
        self.homeUseCases = homeUseCases
    }

    public func getMovies() {
        print("Pillando pelis")
        cancellable = homeUseCases.getTrendingMovies()
            .catch { [weak self] error -> AnyPublisher<[Movie], Never> in
                print("This is the error \(error)")
                return Empty(completeImmediately: true).eraseToAnyPublisher()
            }
            .sink(
                receiveValue: { [weak self] movies in
                    self?.homeView?.presentTrendingMovies(movies)
                }
            )
    }
}
