//
//  MovieDetailPresenter.swift
//  ConcreteMovieApp
//
//  Created by Wilson Kim on 31/03/20.
//  Copyright © 2020 Wilson Kim. All rights reserved.
//

import Foundation

protocol MovieDetailViewProtocol: AnyObject {
    
}

final class MovieDetailPresenter: MovieDetailPresenterProtocol {
    private weak var view: MovieDetailViewProtocol?
    
    func setView(_ view: MovieDetailViewProtocol) {
        self.view = view
    }
}
