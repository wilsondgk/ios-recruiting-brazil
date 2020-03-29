//
//  FavoriteMoviesWorker.swift
//  ConcreteMovieApp
//
//  Created by Wilson Kim on 29/03/20.
//  Copyright © 2020 Wilson Kim. All rights reserved.
//

import Foundation

class FavoriteMoviesWorker: FavoriteMoviesWorkerProtocol {
    
    let provider: ApiProviderProtocol
    
    init(withProvider provider: ApiProviderProtocol) {
        self.provider = provider
    }
}
