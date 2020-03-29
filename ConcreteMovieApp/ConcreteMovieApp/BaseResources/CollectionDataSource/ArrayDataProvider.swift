//
//  ArrayDataProvider.swift
//  Shuffle Songs
//
//  Created by Érico Perez Neto on 05/08/19.
//  Copyright © 2019 Érico Perez Neto. All rights reserved.
//

import Foundation

public class ArrayDataProvider<T>: CollectionDataProvider {
    var items: [[T]] = []
    
    init(array: [[T]]) {
        items = array
    }
    
    public func numberOfSections() -> Int {
        return items.count
    }
    
    public func numberOfItems(in section: Int) -> Int {
        guard section >= 0 && section < items.count else {
            return 0
        }
        
        return items[section].count
    }
    
    public func item(at indexPath: IndexPath) -> T? {
        guard isNotOutOfRange(at: indexPath) else { return nil }
        return items[indexPath.section][indexPath.row]
    }
    
    public func updateItem(at indexPath: IndexPath, value: T) {
        guard isNotOutOfRange(at: indexPath) else { return }
        items[indexPath.section][indexPath.row] = value
    }
    
    private func isNotOutOfRange(at indexPath: IndexPath) -> Bool {
        return (indexPath.section >= 0 &&
            indexPath.section < items.count &&
            indexPath.row >= 0 &&
            indexPath.row < items[indexPath.section].count)
    }
}
