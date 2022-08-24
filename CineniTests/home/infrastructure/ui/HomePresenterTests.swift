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
        let container = AppFactory.createWithMockedRepositoriesAndControllers()
        homePresenter = container.resolve(HomePresenter.self)
        homeView = container.resolve(HomeViewDelegate.self)! as? HomeViewControllerFake
    }

    func test_loads_trending_movies_into_the_view() {
        homePresenter.loadTrendingMovies()

        homeView.expectToHaveTrendingMoviesCount(1)
    }

    func test_loads_trending_tv_shows_into_the_view() {
        homePresenter.loadTrendingTVShows()

        homeView.expectToHaveTrendingTVShowsCount(1)
    }

    func test_loads_popular_movies_into_the_view() {
        homePresenter.loadPopularMovies()

        homeView.expectToHavePopularMoviesCount(1)
    }
}

extension HomeViewControllerFake {
    func expectToHaveTrendingMoviesCount(_ n: Int) {
        expect(self.trendingMovies).to(haveCount(n))
    }

    func expectToHaveTrendingTVShowsCount(_ n: Int) {
        expect(self.trendingTVShows).to(haveCount(n))
    }

    func expectToHavePopularMoviesCount(_ n: Int) {
        expect(self.popularMovies).to(haveCount(n))
    }
}
