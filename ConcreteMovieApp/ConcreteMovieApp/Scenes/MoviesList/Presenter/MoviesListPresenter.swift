//
//  MoviesListPresenter.swift
//  ConcreteMovieApp
//
//  Created by Wilson Kim on 21/03/20.
//  Copyright © 2020 Wilson Kim. All rights reserved.
//

import Foundation

protocol MoviesListViewProtocol: class {
    func showLoading(withMessage message:String)
    func updateMovies(withMoviesViewModel viewModels: [DefaultMovieViewModel])
}

class MoviesListPresenter: MoviesListPresenterProtocol {
    
    private weak var view: MoviesListViewProtocol?
    
    func setView(_ view: MoviesListViewProtocol) {
        self.view = view
    }
    
    func presentLoadingState() {
        view?.showLoading(withMessage: "Carregando filmes...")
    }
    
    func presentMovies(_ movies: [MovieResponseModel]) {
        let viewModels = movies.map { (model) -> DefaultMovieViewModel in
            return DefaultMovieViewModel(name: model.title)
        }
        view?.updateMovies(withMoviesViewModel: viewModels)
    }
}
