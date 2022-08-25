//
//  CreateApp.swift
//  CineniUITests
//
//  Created by Daniel Ramos on 24/8/22.
//

import XCTest

func createApp() -> XCUIApplication {
    let app = XCUIApplication()
    app.launchArguments = ["-UITests"]
    app.launch()
    return app
}
