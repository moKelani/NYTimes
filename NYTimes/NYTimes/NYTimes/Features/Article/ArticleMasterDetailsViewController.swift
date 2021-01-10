//
//  ArticleMasterDetailsViewController.swift
//  NYTimes
//
//  Created by Mohamed Kelany on 09/01/2021.
//  Copyright (c) 2021 com.kelany. All rights reserved.
//

import UIKit

class ArticleMasterDetailsViewController: UISplitViewController {

    // MARK: - Intializers
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

// MARK: Setup
private extension ArticleMasterDetailsViewController {

    func setupViews() {
        showDefaultNavigationBar()
        delegate = self
    }

}
// MARK: Split Delegate
extension ArticleMasterDetailsViewController: UISplitViewControllerDelegate {
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        // Return true to prevent UIKit from applying its default behavior
        return true
    }
}
