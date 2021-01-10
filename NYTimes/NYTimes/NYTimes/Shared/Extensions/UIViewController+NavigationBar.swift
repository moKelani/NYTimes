//
//  UIViewController+NavigationBar.swift
//  NYTimes
//
//  Created by Mohamed Kelany on 10/01/2021.
//

import UIKit

extension UIViewController {

    func showDefaultNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.isNavigationBarHidden = false

        navigationController?.navigationBar.tintColor = UIColor.init(red: 40/255, green: 75/255, blue: 99/255, alpha: 1.0)
        navigationController?.navigationBar.barTintColor = .white

        if var textAttributes = navigationController?.navigationBar.titleTextAttributes {
            textAttributes[NSAttributedString.Key.foregroundColor] = UIColor.init(red: 40/255, green: 75/255, blue: 99/255, alpha: 1.0)
            textAttributes[NSAttributedString.Key.font] =  UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.medium)
            navigationController?.navigationBar.titleTextAttributes = textAttributes
        }

    }

}
