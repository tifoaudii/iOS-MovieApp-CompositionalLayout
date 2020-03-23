//
//  ViewController.swift
//  MovieApp
//
//  Created by Tifo Audi Alif Putra on 04/03/20.
//  Copyright © 2020 BCC FILKOM. All rights reserved.
//

import UIKit

class MovieViewController: BaseViewController {
   
   static let sectionHeaderElementKind = "section-header-element-kind"
   
   lazy var movieCollectionView: UICollectionView = {
      let collectionView = UICollectionView(frame: .zero, collectionViewLayout: setupCollectionViewLayout())
      collectionView.translatesAutoresizingMaskIntoConstraints = false
      collectionView.backgroundColor = .systemBackground
      collectionView.register(TopRatedMovieCell.self, forCellWithReuseIdentifier: TopRatedMovieCell.cellIdentifier)
      collectionView.register(OnGoingMovieCell.self, forCellWithReuseIdentifier: OnGoingMovieCell.cellIdentifier)
      collectionView.register(UpcomingMovieCell.self, forCellWithReuseIdentifier: UpcomingMovieCell.cellIdentifier)
      collectionView.register(PopularMovieCell.self, forCellWithReuseIdentifier: PopularMovieCell.cellIdentifier)
      collectionView.register(HeaderView.self, forSupplementaryViewOfKind: MovieViewController.sectionHeaderElementKind, withReuseIdentifier: HeaderView.reuseIdentifier)
      return collectionView
   }()
   
   public enum MovieSection: String, CaseIterable {
      case topRated = "Top Rated Movies"
      case onGoing = "Now Playing Movies"
      case upcoming = "Upcoming Movies"
      case popular = "Popular Movies"
   }
   
   private let viewModel = MovieViewModel()
   private var movieDataSource: UICollectionViewDiffableDataSource<MovieSection,Movie>?
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      setupViewModel()
      self.setupCollectionView()
   }
}

extension MovieViewController {
   fileprivate func setupViewModel() {
      viewModel.fetchAllMovies()
      viewModel.onCompleteFetchMovies = { [unowned self] in
         self.setupDataSource()
      }
   }
   
   fileprivate func setupCollectionView() {
      view.addSubview(movieCollectionView)
      NSLayoutConstraint.activate([
         movieCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
         movieCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
         movieCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
         movieCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
      ])
   }
   
   func setupCollectionViewLayout() -> UICollectionViewLayout {
      //MARK:- 1. Define the layout
   }
   
   fileprivate func setupDataSource() {
      //MARK:- 2. Define the data source
   }
   
   func generateSnapshot() -> NSDiffableDataSourceSnapshot<MovieSection, Movie> {
      //MARK:- 3. Define the snapshot
   }
   
   fileprivate func createTopRatedMovieSection() -> NSCollectionLayoutSection {
      //MARK:- 4. Define the top rated movie layout section
   }
   
   fileprivate func createOnGoingMovieSection() -> NSCollectionLayoutSection {
      //MARK:- 5. Define the ongoing movie layout section
   }
   
   fileprivate func createUpcomingMovieSection() -> NSCollectionLayoutSection {
      //MARK:- 6. Define the upcoming movie layout section
   }
   
   fileprivate func createPopularMovieSection() -> NSCollectionLayoutSection {
      //MARK:- 7. Define the popular movie layout section
   }
   
}


