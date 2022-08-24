//
//  HomePresenterTests.swift
//  CineniTests
//
//  Created by Daniel Ramos on 23/8/22.
//

@testable import Cineni
import Foundation
import Nimble
import Quick

class HomePresenterSpec: QuickSpec {
    var homePresenter: HomePresenter!
    var homeView: HomeViewControllerFake!

    override func spec() {
        beforeEach {
            let container = AppFactory.create()
            AppFactory.mockRepositories(container)
            AppFactory.mockControllers(container)
            self.homePresenter = container.resolve(HomePresenter.self)
            self.homeView = container.resolve(HomeViewDelegate.self)! as? HomeViewControllerFake
        }

        it("loads trending movies into the view") {
            self.homePresenter.loadTrendingMovies()

            expect(self.homeView.trendingMovies).to(haveCount(1))
        }

        it("loads trending tv shows into the view") {
            self.homePresenter.loadTrendingTVShows()

            expect(self.homeView.trendingTVShows).to(haveCount(1))
        }

        it("loads popular movies into the view") {
            self.homePresenter.loadPopularMovies()

            expect(self.homeView.popularMovies).to(haveCount(1))
        }
    }
}
