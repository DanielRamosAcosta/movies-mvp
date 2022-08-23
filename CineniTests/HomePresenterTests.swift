//
//  HomePresenterTests.swift
//  CineniTests
//
//  Created by Daniel Ramos on 23/8/22.
//

@testable import Cineni
import Foundation
import Quick
import Nimble

class HomePresenterSpec: QuickSpec {
  override func spec() {
    describe("loading the trending movies") {
      it("calls the home view controller with the movies") {
          let container = AppFactory.create()
          AppFactory.mockRepositories(container)
          AppFactory.mockControllers(container)
          let homePresenter = container.resolve(HomePresenter.self)!
          let view = container.resolve(HomeViewDelegate.self)! as! HomeViewControllerFake
          
          homePresenter.getMovies()
          
          expect { view.trendingMovies }.toEventually(haveCount(1))
      }
    }
  }
}
