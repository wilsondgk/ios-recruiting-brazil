//
//  MoviesListWorker.swift
//  ConcreteMovieApp
//
//  Created by Wilson Kim on 21/03/20.
//  Copyright © 2020 Wilson Kim. All rights reserved.
//

import Foundation

class MoviesListWorker: MoviesListWorkerProtocol {
    
    private let provider: ApiProviderProtocol
    
    init(withProvider provider: ApiProviderProtocol) {
        self.provider = provider
    }
    
    func getMoviesList(completion: @escaping (_ successModel: EmptyStruct) -> Void, facil: @escaping (_ errorModel: EmptyStruct) -> Void) {
        let request = RequestBuilder(withUrl: "", andMethod: .get).create()
        provider.makeRequest(withRequestParams: request) { (response: (Response<EmptyStruct, EmptyStruct>)) in
            switch response {
            case .success(let model):
                break
            case .failure(let errorModel, let error):
                break
            }
        }
    }
}
