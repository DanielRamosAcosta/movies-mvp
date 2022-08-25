//
//  CustomMatchers.swift
//  CineniUITests
//
//  Created by Daniel Ramos on 24/8/22.
//

import Nimble
import XCTest

func haveImageWithAlt(_ alt: String) -> Predicate<XCUIApplication> {
    return Predicate { (actualExpression: Expression<XCUIApplication>) throws -> PredicateResult in
        guard let app = try actualExpression.evaluate() else {
            return PredicateResult(status: .fail, message: .fail("expected a non-<nil> XCUIApplication"))
        }

        let exists = app.images[alt].exists

        let message = ExpectationMessage.expectedTo("find image with alt <\(alt)>")

        return PredicateResult(
            bool: exists,
            message: message
        )
    }
}

func haveText(_ alt: String) -> Predicate<XCUIApplication> {
    return Predicate { (actualExpression: Expression<XCUIApplication>) throws -> PredicateResult in
        guard let app = try actualExpression.evaluate() else {
            return PredicateResult(status: .fail, message: .fail("expected a non-<nil> XCUIApplication"))
        }

        let exists = app.staticTexts[alt].exists

        let message = ExpectationMessage.expectedTo("find text <\(alt)>")

        return PredicateResult(
            bool: exists,
            message: message
        )
    }
}
