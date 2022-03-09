//
//  MovieViewCell.swift
//  PPProject
//
//  Created by Priyanka Dobhal on 09/03/22.
//

import Foundation
import UIKit

class MovieViewCell: UITableViewCell {
    //todo: create an extension for adding multiline labels
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()

    private let movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(movieImageView)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        movieImageView.translatesAutoresizingMaskIntoConstraints = false
        //todo: create a file to store spacing constants
        NSLayoutConstraint.activate([
            movieImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                   constant: 16),
            movieImageView.heightAnchor.constraint(equalToConstant: 50),
            movieImageView.widthAnchor.constraint(equalToConstant: 50),
            movieImageView.centerYAnchor.constraint(equalTo: centerYAnchor),

            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor,
                                            constant: 4),
            titleLabel.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor,
                                                constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                 constant: -16),

            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                                  constant: 4),
            descriptionLabel.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor,
                                                constant: 16),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                                    constant: -16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                       constant: -16)
        ])
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        movieImageView.image = nil
    }

    //todo: configure using cell view model
    func configure(viewModel: Movie) {
        titleLabel.text = viewModel.original_title
        descriptionLabel.text = viewModel.overview
        guard let imageData = viewModel.imageData else {
            guard let imagePath = viewModel.poster_path else { return }
            let urlString = "https://image.tmdb.org/t/p/w500\(imagePath)"
            APIClient().fetchImage(urlString: urlString) {  (result) in
                switch result {
                case .success(let data):
                    DispatchQueue.main.async {
                        self.movieImageView.image = UIImage(data: data)
                    }
                    viewModel.imageData = data
                case .failure:
                    break
                }
            }
            return
        }
        movieImageView.image = UIImage(data: imageData)
    }
}
