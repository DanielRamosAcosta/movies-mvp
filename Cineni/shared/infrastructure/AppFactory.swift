//
//  AppFactory.swift
//  Cineni
//
//  Created by Daniel Ramos on 22/8/22.
//

import Foundation
import Swinject

class AppFactory {
    public static func create() -> Container {
        let container = Container()

        container.register(HomeUseCases.self, factory: HomeUseCases.build)
        container.register(MovieRepository.self, factory: MovieRepositoryApi.build)
        container
            .register(HomeViewController.self, factory: HomeViewController.build)
            .initCompleted(HomeViewController.initCompleted)
        container.register(HomeViewDelegate.self) { resolver in resolver.resolve(HomeViewController.self)! }
        container.register(HomePresenter.self, factory: HomePresenter.build)

        return container
    }

    public static func mockRepositories(_ container: Container) {
        container.register(MovieRepository.self, factory: MovieRepositoryFake.build)
    }
    
    public static func mockControllers(_ container: Container) {
        container.register(HomeViewDelegate.self, factory: HomeViewControllerFake.build).inObjectScope(.container)
    }
}
