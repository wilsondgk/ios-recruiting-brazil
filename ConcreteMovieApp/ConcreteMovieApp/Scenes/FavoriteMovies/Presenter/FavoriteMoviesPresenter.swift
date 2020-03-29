//
//  FavoriteMoviesPresenter.swift
//  ConcreteMovieApp
//
//  Created by Wilson Kim on 29/03/20.
//  Copyright © 2020 Wilson Kim. All rights reserved.
//

import Foundation

protocol FavoriteMoviesViewProtocol {
    
}

class FavoriteMoviesPresenter: FavoriteMoviesPresenterProtocol {
    
    var view: FavoriteMoviesViewProtocol?
    
    func setView(_ view: FavoriteMoviesViewProtocol) {
        self.view = view
    }
}
