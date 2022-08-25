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
        try await super.setUp()
        let container = AppFactory.createWithMockedRepositoriesAndControllers()
        homePresenter = container.resolve(HomePresenter.self)
        homeView = container.resolve(HomeViewDelegate.self)! as? HomeViewControllerFake
        continueAfterFailure = false
    }

    func test_loads_trending_movies_into_the_view() {
        homePresenter.loadTrendingMovies()

        homeView.expectToHaveTrendingMoviesCount(1)
        homeView.expectLastTrendingMovieToBe(vengeance.title)
    }

    func test_loads_trending_tv_shows_into_the_view() {
        homePresenter.loadTrendingTVShows()

        homeView.expectToHaveTrendingTVShowsCount(1)
        homeView.expectLastTrendingTVShowToBe(sheHulk.title)
    }

    func test_loads_popular_movies_into_the_view() {
        homePresenter.loadPopularMovies()

        homeView.expectToHavePopularMoviesCount(1)
        homeView.expectLastPopularMovieToBe(dragonBall.title)
    }

    func test_loads_upcoming_movies_into_the_view() {
        homePresenter.loadUpcomingMovies()

        homeView.expectToHaveUpcomingMoviesCount(1)
        homeView.expectLastUpcomingMovieToBe(theBlackPhone.title)
    }

    func test_loads_top_rated_movies_into_the_view() {
        homePresenter.loadTopRatedMovies()

        homeView.expectToHaveTopRatedMoviesCount(1)
        homeView.expectLastTopRatedMovieToBe(theShawshankRedemption.title)
    }
}

extension HomeViewControllerFake {
    func expectToHaveTrendingMoviesCount(_ n: Int) {
        expect(self.trendingMovies).to(haveCount(n))
    }

    func expectLastTrendingMovieToBe(_ title: String) {
        expect(self.trendingMovies[0].getTitle()).to(equal(title))
    }

    func expectToHaveTrendingTVShowsCount(_ n: Int) {
        expect(self.trendingTVShows).to(haveCount(n))
    }

    func expectLastTrendingTVShowToBe(_ title: String) {
        expect(self.trendingTVShows[0].getTitle()).to(equal(title))
    }

    func expectToHavePopularMoviesCount(_ n: Int) {
        expect(self.popularMovies).to(haveCount(n))
    }

    func expectLastPopularMovieToBe(_ title: String) {
        expect(self.popularMovies[0].getTitle()).to(equal(title))
    }

    func expectToHaveUpcomingMoviesCount(_ n: Int) {
        expect(self.upcomingMovies).to(haveCount(n))
    }

    func expectLastUpcomingMovieToBe(_ title: String) {
        expect(self.upcomingMovies[0].getTitle()).to(equal(title))
    }

    func expectToHaveTopRatedMoviesCount(_ n: Int) {
        expect(self.topRatedMovies).to(haveCount(n))
    }

    func expectLastTopRatedMovieToBe(_ title: String) {
        expect(self.topRatedMovies[0].getTitle()).to(equal(title))
    }
}
