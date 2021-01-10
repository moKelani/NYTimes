//
//  UITableView+ReusableCell.swift
//  NYTimes
//
//  Created by Mohamed Kelany on 09/01/2021.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T: CellReusable>(for indexPath: IndexPath) -> T? {
        return self.dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T
    }
}

