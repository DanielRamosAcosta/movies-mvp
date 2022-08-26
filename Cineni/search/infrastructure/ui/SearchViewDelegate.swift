//
//  SearchViewDelegate.swift
//  Cineni
//
//  Created by Daniel Ramos on 25/8/22.
//

import Foundation

protocol SearchViewDelegate: AnyObject {
    func presentTopSearchedMovies(_ movies: [Movie])
    func presentSearchResults(_ movies: [Movie])
}
