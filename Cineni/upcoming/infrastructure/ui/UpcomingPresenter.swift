//
//  UpcomingPresenter.swift
//  Cineni
//
//  Created by Daniel Ramos on 25/8/22.
//

import Combine
import Foundation
import Swinject

class UpcomingPresenter {
    private weak var view: UpcomingViewDelegate?
    let homeUseCases: HomeUseCases
    private var cancellable1: AnyCancellable?
    private var cancellable2: AnyCancellable?
    private var cancellable3: AnyCancellable?
    private var cancellable4: AnyCancellable?
    private var cancellable5: AnyCancellable?

    public static func build(_ resolver: Resolver) -> UpcomingPresenter {
        let delegate = resolver.resolve(UpcomingViewDelegate.self)!
        let homeUseCases = resolver.resolve(HomeUseCases.self)!
        return UpcomingPresenter(delegate: delegate, homeUseCases: homeUseCases)
    }

    init(delegate: UpcomingViewDelegate?, homeUseCases: HomeUseCases) {
        view = delegate
        self.homeUseCases = homeUseCases
    }

    func loadUpcomingMovies() {
        cancellable4 = homeUseCases.getUpcomingMovies()
            .catch { error -> AnyPublisher<[Movie], Never> in
                print("This is the error \(error)")
                return Empty(completeImmediately: true).eraseToAnyPublisher()
            }
            .sink(
                receiveValue: { [weak self] movies in
                    self?.view?.presentMovies(movies)
                }
            )
    }
}
