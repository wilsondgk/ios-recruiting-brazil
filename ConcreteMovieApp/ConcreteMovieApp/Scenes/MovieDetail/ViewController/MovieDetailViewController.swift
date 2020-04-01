//
//  MovieDetailViewController.swift
//  ConcreteMovieApp
//
//  Created by Wilson Kim on 29/03/20.
//  Copyright © 2020 Wilson Kim. All rights reserved.
//

import UIKit

protocol MovieDetailInteractorProtocol {
    
}

class MovieDetailViewController: UIViewController, MovieDetailViewProtocol {

    private let interactor: MovieDetailInteractorProtocol
    
    init(withInteractor interactor: MovieDetailInteractorProtocol) {
        self.interactor = interactor
        super.init(nibName: "MovieDetailViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Detalhe do Filme"
    }
}
