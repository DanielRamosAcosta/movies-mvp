//
//  UpcomingViewDelegate.swift
//  Cineni
//
//  Created by Daniel Ramos on 25/8/22.
//

import Foundation

protocol UpcomingViewDelegate: AnyObject {
    func presentMovies(_ movies: [Movie])
}
