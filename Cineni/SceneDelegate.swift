//
//  SceneDelegate.swift
//  Cineni
//
//  Created by Daniel Ramos on 12/8/22.
//

import Swinject
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo _: UISceneSession, options _: UIScene.ConnectionOptions) {
        print("[SceneDelegate] willConnectTo")

        guard let windowScene = (scene as? UIWindowScene) else { return }

        let container = createContainer()

        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = container.resolve(MainTabBarViewController.self)!
        window?.makeKeyAndVisible()
    }

    private func createContainer() -> Container {
        let container = AppFactory.create()

        if CommandLine.arguments.contains("-WithMockedRepositories") {
            AppFactory.mockRepositories(container)
        }

        return container
    }

    func sceneDidDisconnect(_: UIScene) {
        print("[SceneDelegate] sceneDidDisconnect")
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded
        // (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_: UIScene) {
        print("[SceneDelegate] sceneDidBecomeActive")
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_: UIScene) {
        print("[SceneDelegate] sceneWillResignActive")
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_: UIScene) {
        print("[SceneDelegate] sceneWillEnterForeground")
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_: UIScene) {
        print("[SceneDelegate] sceneDidEnterBackground")
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}
