//
//  TestingAppDelegate.swift
//  CineniTests
//
//  Created by Daniel Ramos on 23/8/22.
//

import Foundation
import UIKit

@objc(TestingAppDelegate)
final class TestingAppDelegate: UIResponder, UIApplicationDelegate {
    func application(
        _: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options _: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        let sceneConfiguration = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
        sceneConfiguration.delegateClass = TestingSceneDelegate.self
        sceneConfiguration.storyboard = nil

        return sceneConfiguration
    }
}
