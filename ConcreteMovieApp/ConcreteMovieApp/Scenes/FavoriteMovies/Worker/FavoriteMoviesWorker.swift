//
//  FavoriteMoviesWorker.swift
//  ConcreteMovieApp
//
//  Created by Wilson Kim on 29/03/20.
//  Copyright © 2020 Wilson Kim. All rights reserved.
//

import Foundation
import CoreData

class FavoriteMoviesWorker: FavoriteMoviesWorkerProtocol {
    
    let provider: LocalApiProtocol
    
    init(withProvider provider: LocalApiProtocol) {
        self.provider = provider
    }
    
    func getFavoriteMovies(successCompletion: @escaping(_ movies: [MovieResponseModel]) -> Void, errorCompletion: @escaping(_ error: Error) -> Void) {
        provider.fetch(MovieData.self, predicate: nil, successCompletion: { (moviesData) in
            let movies = moviesData.compactMap { [weak self] (data) -> MovieResponseModel? in
                return self?.provider.bindMovieData(toMovieModel: data)
            }
            successCompletion(movies)
        }) { (error) in
            errorCompletion(error)
        }
    }
}

extension LocalApiProtocol {
    func bindMovie(toMovieData movie: MovieResponseModel) -> MovieData {
        let movieData = MovieData(context: getContext())
        movieData.id = movie.id
        movieData.name = movie.title
        return movieData
    }
    
    func bindMovieData(toMovieModel movieData: MovieData) -> MovieResponseModel? {
        guard let name = movieData.name else {
            return nil
        }
        return MovieResponseModel(id: movieData.id, title: name)
    }
}
