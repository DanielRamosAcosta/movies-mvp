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
    
    public func configure(with movie: MovieDomain) {
        let url = URL(string: movie.getThumbnailUrl())
        posterImageView.kf.setImage(with: url)
        print("accessibilityLabel", movie.getTitle())
        posterImageView.accessibilityLabel = movie.getTitle()
    }
}