//
//  MovieDetailViewController.swift
//  ConcreteMovieApp
//
//  Created by Wilson Kim on 29/03/20.
//  Copyright © 2020 Wilson Kim. All rights reserved.
//

import UIKit

protocol MovieDetailInteractorProtocol {
    func viewDidLoad()
    func favoriteButtonClicked()
}

class MovieDetailViewController: UIViewController, MovieDetailViewProtocol {

    private let interactor: MovieDetailInteractorProtocol
    @IBOutlet private weak var favoriteButton: UIButton!
    @IBOutlet private weak var movieTitleLabel: UILabel!
    
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
        interactor.viewDidLoad()
    }
    
    @IBAction func favoriteMovieButtonClicked(_ sender: Any) {
        interactor.favoriteButtonClicked()
    }
    
    //MARK: MovieDetailViewProtocol
    func updateMovieDetails(_ movie: MovieResponseModel, isFavorite: Bool) {
        movieTitleLabel.text = movie.title
        favoriteButton.isSelected = isFavorite
    }
}
