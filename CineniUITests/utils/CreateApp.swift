//
//  CreateApp.swift
//  CineniUITests
//
//  Created by Daniel Ramos on 24/8/22.
//

import XCTest

func createApp(withMockedRepositories: Bool = true) -> XCUIApplication {
    let app = XCUIApplication()
    if withMockedRepositories {
        app.launchArguments = ["-WithMockedRepositories"]
    }
    app.launch()
    return app
}
