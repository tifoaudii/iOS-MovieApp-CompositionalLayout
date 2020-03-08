//
//  onGoingMovieCell.swift
//  MovieApp
//
//  Created by Tifo Audi Alif Putra on 07/03/20.
//  Copyright © 2020 BCC FILKOM. All rights reserved.
//

import UIKit
import Kingfisher

class OnGoingMovieCell: UICollectionViewCell {
    
    static let cellIdentifier = "ongoing_movie_cell"
    
    let container = UIView()
    let imageView = UIImageView()
    let titleLabel = UILabel()
    let overviewLabel = UILabel()
    
    var movie: Movie? {
        didSet {
            self.configureCell()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension OnGoingMovieCell {
    func configureCell() {
        container.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(container)
        contentView.addSubview(imageView)
        
        if let movieUrl = movie?.posterURL {
            imageView.kf.setImage(with: movieUrl)
            container.addSubview(imageView)
        }
        
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 4
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.text = movie?.title
        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 0
        
        overviewLabel.text = movie?.overview
        overviewLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        overviewLabel.adjustsFontForContentSizeCategory = true
        overviewLabel.numberOfLines = 0
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let movieLabelStackView = UIStackView(arrangedSubviews: [titleLabel, overviewLabel])
        movieLabelStackView.axis = .vertical
        movieLabelStackView.alignment = .top
        movieLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(movieLabelStackView)
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: contentView.topAnchor),
            container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            imageView.topAnchor.constraint(equalTo: container.topAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10),
            imageView.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -10),
            imageView.widthAnchor.constraint(equalToConstant: 90),
            
            movieLabelStackView.topAnchor.constraint(equalTo: container.topAnchor, constant: 10),
            movieLabelStackView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            movieLabelStackView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -10),
            movieLabelStackView.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -10)
        ])
    }
}
