//
//  TestingSceneDelegate.swift
//  CineniTests
//
//  Created by Daniel Ramos on 23/8/22.
//

import Foundation
import UIKit

class TestingSceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo _: UISceneSession, options _: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = TestingRootViewController()
        window?.makeKeyAndVisible()
    }
}
