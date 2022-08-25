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
    let useCases: UpcomingUseCases
    private var cancellable1: AnyCancellable?

    public static func build(_ resolver: Resolver) -> UpcomingPresenter {
        let delegate = resolver.resolve(UpcomingViewDelegate.self)!
        let useCases = resolver.resolve(UpcomingUseCases.self)!
        return UpcomingPresenter(delegate: delegate, useCases: useCases)
    }

    init(delegate: UpcomingViewDelegate?, useCases: UpcomingUseCases) {
        view = delegate
        self.useCases = useCases
    }

    func loadUpcomingMovies() {
        cancellable1 = useCases.getUpcomingMovies()
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
