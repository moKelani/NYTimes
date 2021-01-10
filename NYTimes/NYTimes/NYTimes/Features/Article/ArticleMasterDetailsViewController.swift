//
//  ArticleMasterDetailsViewController.swift
//  NYTimes
//
//  Created by Mohamed Kelany on 09/01/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ArticleMasterDetailsViewController: UISplitViewController, UISplitViewControllerDelegate {
    fileprivate let viewModel: ArticleMasterDetailsViewModel
    fileprivate let router: ArticleMasterDetailsRouter
    fileprivate let disposeBag = DisposeBag()
    
   // private var reachability: Reachability?

    init(withViewModel viewModel: ArticleMasterDetailsViewModel, router: ArticleMasterDetailsRouter) {
        self.viewModel = viewModel
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupLayout()
        setupRx()
    }

    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
            // Return true to prevent UIKit from applying its default behavior
            return true
        }
    
}

// MARK: Setup
private extension ArticleMasterDetailsViewController {

    func setupViews() {
        delegate = self
    }

    func setupLayout() {
    
    }

    func setupRx() {
    
    }
}
