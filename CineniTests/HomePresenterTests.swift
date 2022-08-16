//
//  HomePresenterTests.swift
//  CineniTests
//
//  Created by Daniel Ramos on 16/8/22.
//

import XCTest
@testable import Cineni


class HomeViewFake : HomeView {
    private var movies: [Movie] = []
    private var alertCalled = false
    private var alertCalledWith = ""
    
    func presentMovies(movies: [Movie]) {
        self.movies = movies
    }
    
    func presentAlert(title: String) {
        alertCalled = true
        alertCalledWith = title
    }
    
    public func expectToHaveMovies() {
        XCTAssertEqual(self.movies.count, 8)
    }
    
    public func expectToHaveCalledAlertWith(title: String) {
        XCTAssertEqual(self.alertCalled, true)
        XCTAssertEqual(self.alertCalledWith, title)
    }
}


func homePresenterFakeFactory(view: HomeView, repository: MovieRepository = MovieRepositoryFake()) -> HomePresenter {
    return HomePresenter(delegate: view, getMovieList: GetMovieList(repository))
}


class HomePresenterTests: XCTestCase {
    func testThatShowsTheMoviesAtTheView() throws {
        let view = HomeViewFake()
        let homePresenter = homePresenterFakeFactory(view: view)
        
        homePresenter.getMovies()
        
        view.expectToHaveMovies()
    }
    
    func testThatAnErrorShowsAnAlert() throws {
        let view = HomeViewFake()
        let movieRepository = MovieRepositoryFake(simulateErrors: true)
        let homePresenter = homePresenterFakeFactory(view: view, repository: movieRepository)
        
        homePresenter.getMovies()
        
        view.expectToHaveCalledAlertWith(title: "apiNotReachable")
    }
}
