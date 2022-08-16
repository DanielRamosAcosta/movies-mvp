//
//  HomePresenter.swift
//  Cineni
//
//  Created by Daniel Ramos on 12/8/22.
//

import Combine
import Foundation
import UIKit

protocol HomeView: AnyObject {
    func presentMovies(movies: [Movie])
    func presentAlert(title: String)
}

class HomePresenter {
    private weak var homeView: HomeView?
    private let getMovieList: GetMovieList
    private var cancellable: AnyCancellable?

    init(delegate: HomeView, getMovieList: GetMovieList) {
        homeView = delegate
        self.getMovieList = getMovieList
    }

    public func getMovies() {
        print("Pillando pelis")
        cancellable = getMovieList.execute()
            .catch { [weak self] error -> AnyPublisher<[Movie], Never> in
                print("This is the error \(error)")
                self?.homeView?.presentAlert(title: "\(error)")
                return Empty(completeImmediately: true).eraseToAnyPublisher()
            }
            .sink(
                receiveValue: { [weak self] movies in
                    self?.homeView?.presentMovies(movies: movies)
                }
            )
    }
}

func homePresenterApiFactory(_ delegate: HomeView) -> HomePresenter {
    return HomePresenter(delegate: delegate, getMovieList: GetMovieList(MovieRepositoryApi()))
}
