//
//  JsonMockProvider.swift
//  ConcreteMovieAppTests
//
//  Created by Wilson Kim on 06/04/20.
//  Copyright © 2020 Wilson Kim. All rights reserved.
//

import Foundation

class JsonMockProvider {
    
    let fileName: String
    var fileExtension: String = "json"
    
    init(fileName: String) {
        self.fileName = fileName
    }
    
    init(fileName: String, fileExtension: String) {
        self.fileName = fileName
        self.fileExtension = fileExtension
    }
    
    func getData() -> Data {
        let testBundle = Bundle(for: type(of: self))
        let filePath = testBundle.path(forResource: fileName, ofType: fileExtension)
        let data = NSData(contentsOfFile: filePath!)
        
        return data! as Data
    }
}
