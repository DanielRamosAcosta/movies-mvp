//
//  HomePresenterTests.swift
//  CineniTests
//
//  Created by Daniel Ramos on 16/8/22.
//

@testable import Cineni
import Nimble
import Quick
import XCTest

func homePresenterFakeFactory(view: HomeView, repository: MovieRepository = MovieRepositoryFake()) -> HomePresenter {
    return HomePresenter(delegate: view, getMovieList: GetMovieList(repository))
}

class HomePresenterSpec: QuickSpec {
    override func spec() {
        describe("the Home view presenter") {
            it("shows the movies at the view") {
                let view = HomeViewFake()
                let homePresenter = homePresenterFakeFactory(view: view)

                homePresenter.getMovies()

                view.expectToHaveMovies()
            }

            it("shows an alert if an error occurs") {
                let view = HomeViewFake()
                let movieRepository = MovieRepositoryFake(simulateErrors: true)
                let homePresenter = homePresenterFakeFactory(view: view, repository: movieRepository)

                homePresenter.getMovies()

                view.expectToHaveCalledAlertWith(title: "apiNotReachable")
            }
        }
    }
}
