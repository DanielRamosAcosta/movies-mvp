//
//  HomePresenter.swift
//  Cineni
//
//  Created by Daniel Ramos on 22/8/22.
//

import Combine
import Foundation
import Swinject

class HomePresenter {
    private weak var homeView: HomeViewDelegate?
    let homeUseCases: HomeUseCases
    private var cancellable: AnyCancellable?

    public static func build(_ resolver: Resolver) -> HomePresenter {
        let delegate = resolver.resolve(HomeViewDelegate.self)!
        let homeUseCases = resolver.resolve(HomeUseCases.self)!
        return HomePresenter(delegate: delegate, homeUseCases: homeUseCases)
    }

    init(delegate: HomeViewDelegate?, homeUseCases: HomeUseCases) {
        homeView = delegate
        self.homeUseCases = homeUseCases
    }

    public func getMovies() {
        cancellable = homeUseCases.getTrendingMovies()
            .catch { error -> AnyPublisher<[Movie], Never> in
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
