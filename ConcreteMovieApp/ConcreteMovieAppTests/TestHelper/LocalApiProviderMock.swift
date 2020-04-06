//
//  LocalApiProviderMock.swift
//  ConcreteMovieAppTests
//
//  Created by Wilson Kim on 06/04/20.
//  Copyright © 2020 Wilson Kim. All rights reserved.
//

import Foundation
import CoreData
@testable import ConcreteMovieApp

class LocalApiProviderMock: LocalApiProtocol {
    
    let success: Bool
    
    init(shouldSuccessRequest success: Bool) {
        self.success = success
    }
    
    func getContext() -> NSManagedObjectContext {
        let persistentContainer: NSPersistentContainer = {
            let container = NSPersistentContainer(name: "ConcreteMovieApp")
            container.loadPersistentStores(completionHandler: { (storeDescription, error) in
                if let error = error as NSError? {
                    fatalError("Unresolved error \(error), \(error.userInfo)")
                }
            })
            return container
        }()
        return persistentContainer.viewContext
    }
    
    func fetch<T>(_ entity: T.Type, predicate: NSPredicate?, successCompletion: @escaping ([T]) -> Void, failCompletion: @escaping (Error) -> Void) where T : NSManagedObject {
        if success {
            successCompletion([])
            return
        }
        failCompletion(ErrorMock())
    }
    
    func saveObject(_ object: NSManagedObject, successCompletion: @escaping () -> Void, failCompletion: @escaping (Error) -> Void) {
        
    }
    
    func delete<T>(_ entity: T.Type, predicate: NSPredicate, successCompletion: @escaping () -> Void, failCompletion: @escaping (Error) -> Void) where T : NSManagedObject {
        
    }
}
