//
//  HomeViewFake.swift
//  CineniTests
//
//  Created by Daniel Ramos on 16/8/22.
//

@testable import Cineni
import XCTest

class HomeViewFake: HomeView {
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
        XCTAssertEqual(movies.count, 8)
    }

    public func expectToHaveCalledAlertWith(title: String) {
        XCTAssertEqual(alertCalled, true)
        XCTAssertEqual(alertCalledWith, title)
    }
}
