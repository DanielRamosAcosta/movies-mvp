//
//  TitleCollectionViewCell.swift
//  Cineni
//
//  Created by Daniel Ramos on 19/8/22.
//

import Kingfisher
import UIKit

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

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }

    public func configure(with media: MediaElement) {
        let url = URL(string: media.getThumbnailUrl())
        posterImageView.kf.setImage(with: url)
        posterImageView.accessibilityLabel = media.getTitle()
    }
}
