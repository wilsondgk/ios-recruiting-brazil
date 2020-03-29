//
//  MoviesListWorker.swift
//  ConcreteMovieApp
//
//  Created by Wilson Kim on 21/03/20.
//  Copyright © 2020 Wilson Kim. All rights reserved.
//

import Foundation

final class MoviesListWorker: MoviesListWorkerProtocol {
    
    private let provider: ApiProviderProtocol
    
    init(withProvider provider: ApiProviderProtocol) {
        self.provider = provider
    }
    
    func getMoviesList(successCompletion: @escaping (_ movies: GeneralMovieResponseModel) -> Void, failCompletion: @escaping (_ error: Error) -> Void) {
        let params = ["api_key" : "de94a58f8f1c55104fa3b01661f5c0d5"]
        let request = RequestBuilder(withUrl: "https://api.themoviedb.org/3", andMethod: .get)
            .withPath("/movie/popular")
            .withQuery(params)
            .create()
        provider.makeRequest(withRequestParams: request) { (response: (Response<GeneralMovieResponseModel, EmptyStruct>)) in
            switch response {
            case .success(let movies):
                successCompletion(movies)
                break
            case .failure(_, let error):
                failCompletion(error)
                break
            }
        }
    }
}
