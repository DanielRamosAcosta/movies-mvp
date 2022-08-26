//
//  SerachResultsViewController.swift
//  Cineni
//
//  Created by Daniel Ramos on 25/8/22.
//

import UIKit

class SerachResultsViewController: UIViewController {
    private var movies: [Movie] = []

    let searchResultCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 3 - 10, height: 180)
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(
            TitleCollectionViewCell.self,
            forCellWithReuseIdentifier: TitleCollectionViewCell.identifier
        )
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGreen
        view.addSubview(searchResultCollectionView)
        searchResultCollectionView.delegate = self
        searchResultCollectionView.dataSource = self
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchResultCollectionView.frame = view.bounds
    }

    public func presentMovies(_ movies: [Movie]) {
        self.movies = movies

        DispatchQueue.main.async {
            self.searchResultCollectionView.reloadData()
        }
    }
}

extension SerachResultsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return movies.count
    }

    func collectionView(_: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = searchResultCollectionView.dequeueReusableCell(
            withReuseIdentifier: TitleCollectionViewCell.identifier,
            for: indexPath
        ) as? TitleCollectionViewCell else {
            return UICollectionViewCell()
        }

        let movie = movies[indexPath.row]
        cell.configure(with: Movie(title: movie.getTitle(), posterPath: movie.getThumbnailUrl()))

        return cell
    }
}
