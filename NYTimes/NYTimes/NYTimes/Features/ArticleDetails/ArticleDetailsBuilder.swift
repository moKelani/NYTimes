//
//  ArticleDetailsBuilder.swift
//  NYTimes
//
//  Created by Mohamed Kelany on 09/01/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

struct ArticleDetailsBuilder {

    static func viewController() -> UIViewController {
        let viewModel = ArticleDetailsViewModel()
        let router = ArticleDetailsRouter()
        let viewController = ArticleDetailsViewController(withViewModel: viewModel, router: router)
        router.viewController = viewController
       // viewController.

        return viewController
    }
}
