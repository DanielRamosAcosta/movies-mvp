//
//  TitleCollectionViewCell.swift
//  Cineni
//
//  Created by Daniel Ramos on 19/8/22.
//

import UIKit
import Kingfisher

class TitleCollectionViewCell: UICollectionViewCell {
    static let identifier = "TitleCollectionViewCell"
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }
    
    public func configure(with movie: Movie) {
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(movie.poster_path)")
        posterImageView.kf.setImage(with: url)
        print("accessibilityLabel", movie.title)
        posterImageView.accessibilityLabel = movie.title
    }
}
