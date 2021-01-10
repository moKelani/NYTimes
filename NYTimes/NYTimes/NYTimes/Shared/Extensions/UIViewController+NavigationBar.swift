//
//  UIViewController+NavigationBar.swift
//  NYTimes
//
//  Created by Mohamed Kelany on 10/01/2021.
//

import UIKit

extension UIViewController {
     
    func showDefaultNavigationBar() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black,
                                                                   NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.medium)]
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.isNavigationBarHidden = false
        let image = UIImage(named: "whiteBg")
        navigationController?.navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()

    }

}


