//
//  TrendingMovieCell.swift
//  MovieApp
//
//  Created by Tifo Audi Alif Putra on 07/03/20.
//  Copyright © 2020 BCC FILKOM. All rights reserved.
//

import UIKit
import Kingfisher

class TopRatedMovieCell: UICollectionViewCell {
    
    static let cellIdentifier = "top_rated_movie_cell"
    
    let container = UIView()
    let imageView = UIImageView()
    let titleLabel = UILabel()
    
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

extension TopRatedMovieCell {
    func configureCell() {
        container.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(container)
        contentView.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        if let movieUrl = movie?.posterURL {
            imageView.kf.setImage(with: movieUrl)
        }
        
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 4
        container.addSubview(imageView)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = movie?.title
        titleLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        titleLabel.adjustsFontForContentSizeCategory = true
        container.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: contentView.topAnchor),
            container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            
            imageView.topAnchor.constraint(equalTo: container.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -10),
            titleLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -10)
        ])
        
        titleLabel.setContentHuggingPriority(UILayoutPriority(252), for: .vertical)
        titleLabel.setContentCompressionResistancePriority(.init(rawValue: 751), for: .vertical)
    }
}
