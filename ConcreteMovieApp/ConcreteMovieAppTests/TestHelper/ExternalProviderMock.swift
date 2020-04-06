//
//  ExternalProviderMock.swift
//  ConcreteMovieAppTests
//
//  Created by Wilson Kim on 06/04/20.
//  Copyright © 2020 Wilson Kim. All rights reserved.
//

import Foundation
@testable import ConcreteMovieApp

class ExternalApiProviderMock: ApiProviderProtocol {
    
    let success: Bool
    let data: Data
    
    init(shouldSuccessRequest success: Bool, withData data: Data) {
        self.success = success
        self.data = data
    }
    
    func makeRequest<SuccessModel, ErrorModel>(withRequestParams requestParams: HTTPRequestParamsProtocol, completion: @escaping (Response<SuccessModel, ErrorModel>) -> Void) where SuccessModel : Decodable, ErrorModel : Decodable {
        if success {
            do {
                let resultDecoded = try JSONDecoder().decode(SuccessModel.self, from: data)
                completion(.success(resultDecoded))
            } catch {
                completion(.failure(nil, error))
            }
            return
        }
        completion(.failure(nil, ErrorMock()))
    }
}

struct DecodableMock: Decodable {
    
}
