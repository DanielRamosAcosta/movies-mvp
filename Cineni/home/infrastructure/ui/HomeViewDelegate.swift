//
//  HomePresenter.swift
//  Cineni
//
//  Created by Daniel Ramos on 22/8/22.
//

import Foundation

protocol HomeViewDelegate: AnyObject {
    func presentTrendingMovies(_ movies: [MovieDomain])
}
