//
//  ArticleDetailsViewController.swift
//  NYTimes
//
//  Created by Mohamed Kelany on 09/01/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Network

class ArticleDetailsViewController: UIViewController {
    fileprivate let viewModel: ArticleDetailsViewModel
    fileprivate let router: ArticleDetailsRouter
    fileprivate let disposeBag = DisposeBag()

    
    init(withViewModel viewModel: ArticleDetailsViewModel, router: ArticleDetailsRouter) {
        self.viewModel = viewModel
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .green
        setupViews()
        setupLayout()
        setupRx()
    }
}

// MARK: Setup
private extension ArticleDetailsViewController {

    func setupViews() {
        
    }

    func setupLayout() {
    
    }

    func setupRx() {
    
    }
}

