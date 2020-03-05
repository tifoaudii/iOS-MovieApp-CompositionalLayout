//
//  ViewController.swift
//  MovieApp
//
//  Created by Tifo Audi Alif Putra on 04/03/20.
//  Copyright © 2020 BCC FILKOM. All rights reserved.
//

import UIKit

class MovieViewController: BaseViewController {
    
    let viewModel = MovieViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        setupViewModel()
    }

    func setupViewModel() {
        viewModel.fetchAllMovies()
        viewModel.onCompleteFetchMovies = {
            print(self.viewModel.topRatedMovies)
        }
    }

}

