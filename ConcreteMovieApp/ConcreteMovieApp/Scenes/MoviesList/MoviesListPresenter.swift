//
//  MoviesListPresenter.swift
//  ConcreteMovieApp
//
//  Created by Wilson Kim on 21/03/20.
//  Copyright © 2020 Wilson Kim. All rights reserved.
//

import Foundation

protocol MoviesListViewProtocol: class {
    func showLoading()
}

class MoviesListPresenter: MoviesListPresenterProtocol {
    
    private weak var view: MoviesListViewProtocol?
    
    func setView(_ view: MoviesListViewProtocol) {
        self.view = view
    }
    
    func presentLoadingState() {
        view?.showLoading()
    }
}
