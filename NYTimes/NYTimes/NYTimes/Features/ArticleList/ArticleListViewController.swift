//
//  ArticleListViewController.swift
//  NYTimes
//
//  Created by Mohamed Kelany on 09/01/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ArticleListViewController: UIViewController {
    fileprivate let viewModel: ArticleListViewModel
    fileprivate let router: ArticleListRouter
    fileprivate let disposeBag = DisposeBag()

    init(withViewModel viewModel: ArticleListViewModel, router: ArticleListRouter) {
        self.viewModel = viewModel
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        setupViews()
        setupLayout()
        setupRx()
    }
}

// MARK: Setup
private extension ArticleListViewController {

    func setupViews() {
        
    }

    func setupLayout() {
    
    }

    func setupRx() {
    
    }
}
