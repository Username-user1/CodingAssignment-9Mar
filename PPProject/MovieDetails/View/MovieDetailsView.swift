//
//  MovieDetailsView.swift
//  PPProject
//
//  Created by Priyanka Dobhal on 09/03/22.
//

import Foundation
import UIKit

class MovieDetailsView: UIView {
    let movieImage = UIImageView()
    let releaseDateTitleLabel = UILabel()
    let releaseDateLabel = UILabel()
    let ratingTitleLabel = UILabel()
    let ratingLabel = UILabel()
    let popularityTitleLabel = UILabel()
    let popularityLabel = UILabel()
    let overviewTitleLabel = UILabel()
    let overviewLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        constructViewHeirarchy()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func constructViewHeirarchy() {
        //an extension for view can be  created here that automatically sets this value as false
        releaseDateLabel.translatesAutoresizingMaskIntoConstraints = false
        releaseDateTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        popularityTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        popularityLabel.translatesAutoresizingMaskIntoConstraints = false
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
        overviewTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        movieImage.translatesAutoresizingMaskIntoConstraints = false
        addSubview(overviewLabel)
        addSubview(overviewTitleLabel)
        addSubview(movieImage)
        addSubview(releaseDateLabel)
        addSubview(releaseDateTitleLabel)
        addSubview(ratingLabel)
        addSubview(ratingTitleLabel)
        addSubview(popularityLabel)
        addSubview(popularityTitleLabel)
        constructSubviewConstraints()
    }

    private func constructSubviewConstraints() {
        //todo: move spacing to a constants file
        NSLayoutConstraint.activate([
            movieImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            movieImage.heightAnchor.constraint(equalToConstant: 150),
            movieImage.widthAnchor.constraint(equalToConstant: 150),

            releaseDateTitleLabel.leadingAnchor.constraint(equalTo: movieImage.trailingAnchor,
                                                          constant: 4),
            releaseDateTitleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),

            releaseDateLabel.topAnchor.constraint(equalTo: releaseDateTitleLabel.bottomAnchor),
            releaseDateLabel.leadingAnchor.constraint(equalTo: movieImage.trailingAnchor,
                                                      constant: 4),

            ratingTitleLabel.topAnchor.constraint(equalTo: releaseDateLabel.bottomAnchor,
                                                  constant: 4),
            ratingTitleLabel.leadingAnchor.constraint(equalTo: movieImage.trailingAnchor,
                                                      constant: 4),

            ratingLabel.topAnchor.constraint(equalTo: ratingTitleLabel.bottomAnchor),
            ratingLabel.leadingAnchor.constraint(equalTo: movieImage.trailingAnchor,
                                                 constant: 4),

            popularityTitleLabel.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor,
                                                      constant: 4),
            popularityTitleLabel.leadingAnchor.constraint(equalTo: movieImage.trailingAnchor,
                                                          constant: 4),

            popularityLabel.topAnchor.constraint(equalTo: popularityTitleLabel.bottomAnchor),
            popularityLabel.leadingAnchor.constraint(equalTo: movieImage.trailingAnchor,
                                                     constant: 4),

            overviewTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            overviewTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            overviewTitleLabel.bottomAnchor.constraint(equalTo: overviewLabel.topAnchor),
            overviewTitleLabel.topAnchor.constraint(equalTo: movieImage.bottomAnchor),

            overviewLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            overviewLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    func configureView(viewModel: MovieDetailsViewModel) {
        overviewTitleLabel.text = viewModel.overviewTitle
        releaseDateTitleLabel.text = viewModel.releaseDateTitle
        releaseDateLabel.text = viewModel.releaseDate
        ratingTitleLabel.text = viewModel.ratingTitle
        ratingLabel.text = viewModel.rating
        popularityTitleLabel.text = viewModel.popularityTitle
        popularityLabel.text = viewModel.popularity
        overviewLabel.text = viewModel.overview ?? ""
        guard let imageData =  viewModel.imageData else {return }
        movieImage.image = UIImage(data: imageData)
    }
}
