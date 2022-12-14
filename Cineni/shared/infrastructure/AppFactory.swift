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

        container.register(Localizer.self, factory: LocalizerNative.build)

        container.register(MainTabBarViewController.self, factory: MainTabBarViewController.build)

        container.register(MovieRepository.self, factory: MovieRepositoryApi.build)
        container.register(TVShowRepository.self, factory: TVShowRepositoryApi.build)

        container.register(HomeUseCases.self, factory: HomeUseCases.build)
        container
            .register(HomeViewController.self, factory: HomeViewController.build)
            .initCompleted(HomeViewController.initCompleted)
        container.register(HomeViewDelegate.self) { resolver in resolver.resolve(HomeViewController.self)! }
        container.register(HomePresenter.self, factory: HomePresenter.build)

        container.register(UpcomingUseCases.self, factory: UpcomingUseCases.build)
        container
            .register(UpcomingViewController.self, factory: UpcomingViewController.build)
            .initCompleted(UpcomingViewController.initCompleted)
        container.register(UpcomingViewDelegate.self) { resolver in resolver.resolve(UpcomingViewController.self)! }
        container.register(UpcomingPresenter.self, factory: UpcomingPresenter.build)

        container.register(SearchUseCases.self, factory: SearchUseCases.build)
        container
            .register(SearchViewController.self, factory: SearchViewController.build)
            .initCompleted(SearchViewController.initCompleted)
        container.register(SearchViewDelegate.self) { resolver in resolver.resolve(SearchViewController.self)! }
        container.register(SearchPresenter.self, factory: SearchPresenter.build)

        container.register(DownloadsViewController.self, factory: DownloadsViewController.build)

        return container
    }

    static func createWithMockedRepositoriesAndControllers() -> Container {
        let container = AppFactory.create()

        AppFactory.mockRepositories(container)
        AppFactory.mockControllers(container)
        AppFactory.mockServices(container)

        return container
    }

    public static func mockRepositories(_ container: Container) {
        container.register(MovieRepository.self, factory: MovieRepositoryFake.build)
        container.register(TVShowRepository.self, factory: TVShowRepositoryFake.build)
    }

    public static func mockControllers(_ container: Container) {
        container.register(HomeViewDelegate.self, factory: HomeViewControllerFake.build).inObjectScope(.container)
    }

    public static func mockServices(_ container: Container) {
        container.register(Localizer.self, factory: LocalizerFake.build).inObjectScope(.container)
    }
}
