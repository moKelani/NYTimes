//
//  ArticleListBuilder.swift
//  NYTimes
//
//  Created by Mohamed Kelany on 09/01/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

struct ArticleListBuilder {

    static func viewController() -> UIViewController {
        let viewModel = ArticleListViewModel()
        let router = ArticleListRouter()
        let viewController = ArticleListViewController(withViewModel: viewModel, router: router)
        router.viewController = viewController

        return viewController
    }
}
