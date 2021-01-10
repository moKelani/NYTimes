//
//  CellReusable.swift
//  NYTimes
//
//  Created by Mohamed Kelany on 09/01/2021.
//

import Foundation

protocol CellReusable {
    static var identifier: String { get }
}

extension CellReusable {
    static var identifier: String {
        return "\(self)"
    }
}
