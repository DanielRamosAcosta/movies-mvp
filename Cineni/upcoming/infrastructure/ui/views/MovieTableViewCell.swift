//
//  TitleTableViewCell.swift
//  Cineni
//
//  Created by Daniel Ramos on 25/8/22.
//
import Kingfisher
import UIKit

class MovieTableViewCell: UITableViewCell {
    static let identifier = "MovieTableViewCell"

    private let playMovieButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false

        let imageConfiguration = UIImage.SymbolConfiguration(pointSize: 30)
        let image = UIImage(systemName: "play.circle", withConfiguration: imageConfiguration)
        button.setImage(image, for: .normal)
        button.tintColor = .white
        return button
    }()

    private let moviePoster: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()

    private let movieTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byTruncatingTail
        label.adjustsFontSizeToFitWidth = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(moviePoster)
        contentView.addSubview(movieTitleLabel)
        contentView.addSubview(playMovieButton)
        applyConstraints()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError()
    }

    private func applyConstraints() {
        let moviePosterConstraints = [
            moviePoster.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            moviePoster.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            moviePoster.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            moviePoster.widthAnchor.constraint(equalToConstant: 65),
        ]

        let movieTitleLabelConstraints = [
            movieTitleLabel.leadingAnchor.constraint(equalTo: moviePoster.trailingAnchor, constant: 20),
            movieTitleLabel.trailingAnchor.constraint(equalTo: playMovieButton.leadingAnchor, constant: -20),
            movieTitleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ]

        let playMovieButton = [
            playMovieButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            playMovieButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            playMovieButton.widthAnchor.constraint(equalTo: playMovieButton.heightAnchor),
        ]

        NSLayoutConstraint.activate(moviePosterConstraints)
        NSLayoutConstraint.activate(movieTitleLabelConstraints)
        NSLayoutConstraint.activate(playMovieButton)
    }

    func configure(with movie: Movie) {
        let posterUrl = movie.getThumbnailUrl()
        let url = URL(string: posterUrl)
        moviePoster.kf.setImage(with: url)
        moviePoster.accessibilityLabel = movie.getTitle()
        movieTitleLabel.text = movie.getTitle()
    }
}
