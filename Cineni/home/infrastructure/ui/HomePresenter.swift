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
    private var cancellable1: AnyCancellable?
    private var cancellable2: AnyCancellable?
    private var cancellable3: AnyCancellable?
    private var cancellable4: AnyCancellable?
    private var cancellable5: AnyCancellable?

    public static func build(_ resolver: Resolver) -> HomePresenter {
        let delegate = resolver.resolve(HomeViewDelegate.self)!
        let homeUseCases = resolver.resolve(HomeUseCases.self)!
        return HomePresenter(delegate: delegate, homeUseCases: homeUseCases)
    }

    init(delegate: HomeViewDelegate?, homeUseCases: HomeUseCases) {
        homeView = delegate
        self.homeUseCases = homeUseCases
    }

    func loadTrendingMovies() {
        cancellable1 = homeUseCases.getTrendingMovies()
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

    func loadTrendingTVShows() {
        cancellable2 = homeUseCases.getTrendingTVShows()
            .catch { error -> AnyPublisher<[TVShow], Never> in
                print("This is the error \(error)")
                return Empty(completeImmediately: true).eraseToAnyPublisher()
            }
            .sink(
                receiveValue: { [weak self] tvShows in
                    self?.homeView?.presentTrendingTVShows(tvShows)
                }
            )
    }

    func loadPopularMovies() {
        cancellable3 = homeUseCases.getPopularMovies()
            .catch { error -> AnyPublisher<[Movie], Never> in
                print("This is the error \(error)")
                return Empty(completeImmediately: true).eraseToAnyPublisher()
            }
            .sink(
                receiveValue: { [weak self] movies in
                    self?.homeView?.presentPopularMovies(movies)
                }
            )
    }

    func loadUpcomingMovies() {
        cancellable4 = homeUseCases.getUpcomingMovies()
            .catch { error -> AnyPublisher<[Movie], Never> in
                print("This is the error \(error)")
                return Empty(completeImmediately: true).eraseToAnyPublisher()
            }
            .sink(
                receiveValue: { [weak self] movies in
                    self?.homeView?.presentUpcomingMovies(movies)
                }
            )
    }

    func loadTopRatedMovies() {
        cancellable5 = homeUseCases.getTopRatedMovies()
            .catch { error -> AnyPublisher<[Movie], Never> in
                print("This is the error \(error)")
                return Empty(completeImmediately: true).eraseToAnyPublisher()
            }
            .sink(
                receiveValue: { [weak self] movies in
                    self?.homeView?.presentTopRatedMovies(movies)
                }
            )
    }
}
