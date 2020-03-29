//
//  ReusableCell.swift
//  Shuffle Songs
//
//  Created by Érico Perez Neto on 05/08/19.
//  Copyright © 2019 Érico Perez Neto. All rights reserved.
//

import Foundation

protocol ReusableCell {
    static var reuseIdentifier: String { get }
}

extension ReusableCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
