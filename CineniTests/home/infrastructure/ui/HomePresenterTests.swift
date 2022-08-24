//
//  HomePresenterTests.swift
//  CineniTests
//
//  Created by Daniel Ramos on 23/8/22.
//

@testable import Cineni
import Nimble
import XCTest

class HomePresenterTests: XCTestCase {
    var homePresenter: HomePresenter!
    var homeView: HomeViewControllerFake!

    override func setUp() async throws {
        let container = AppFactory.create()
        AppFactory.mockRepositories(container)
        AppFactory.mockControllers(container)
        homePresenter = container.resolve(HomePresenter.self)
        homeView = container.resolve(HomeViewDelegate.self)! as? HomeViewControllerFake
    }

    func test_loads_trending_movies_into_the_view() throws {
        homePresenter.loadTrendingMovies()

        expect(self.homeView.trendingMovies).to(haveCount(1))
    }

    func test_loads_trending_tv_shows_into_the_view() {
        homePresenter.loadTrendingTVShows()

        expect(self.homeView.trendingTVShows).to(haveCount(1))
    }

    func test_loads_popular_movies_into_the_view() {
        homePresenter.loadPopularMovies()

        expect(self.homeView.popularMovies).to(haveCount(1))
    }
}
