//
//  FavoriteMoviesInteractor.swift
//  ConcreteMovieApp
//
//  Created by Wilson Kim on 29/03/20.
//  Copyright © 2020 Wilson Kim. All rights reserved.
//

import Foundation

protocol FavoriteMoviesWorkerProtocol {
    
}

protocol FavoriteMoviesPresenterProtocol {
    
}

final class FavoriteMoviesInteractor: FavoriteMoviesInteractorProtocol {
    private let presenter: FavoriteMoviesPresenterProtocol
    private let worker: FavoriteMoviesWorkerProtocol
    
    init(withPresenter presenter: FavoriteMoviesPresenterProtocol,
         andWorker worker: FavoriteMoviesWorkerProtocol) {
        self.presenter = presenter
        self.worker = worker
    }
}
