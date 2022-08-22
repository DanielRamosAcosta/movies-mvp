//
//  SceneDelegate.swift
//  Cineni
//
//  Created by Daniel Ramos on 12/8/22.
//

import UIKit
import Swinject

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo _: UISceneSession, options _: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = MainTabBarViewController(createContainer())
        window?.makeKeyAndVisible()
    }
    
    func createContainer() -> Container {
        let container = Container()

        container.register(HomeUseCases.self) { resolver in HomeUseCases(resolver.resolve(MovieRepository.self)!) }
        container.register(MovieRepository.self) { _ in MovieRepositoryApi() }
        container.register(HomeViewController.self) {resolver in HomeViewController(resolver.resolve(HomeUseCases.self)!)}
        container.register(HomeViewDelegate.self) {resolver in resolver.resolve(HomeViewController.self)!}
        container.register(HomePresenter.self) { resolver in HomePresenter(delegate: resolver.resolve(HomeViewDelegate.self)!, homeUseCases: resolver.resolve(HomeUseCases.self)!) }
        
        if CommandLine.arguments.contains("-UITests") {
            container.register(MovieRepository.self) { _ in MovieRepositoryFake() }
        }

        return container
    }

    func sceneDidDisconnect(_: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}
