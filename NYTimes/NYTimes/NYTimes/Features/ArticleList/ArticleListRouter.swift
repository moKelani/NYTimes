//
//  ArticleListRouter.swift
//  NYTimes
//
//  Created by Mohamed Kelany on 09/01/2021.
//  Copyright (c) 2021 com.kelany. All rights reserved.
//

import UIKit

class ArticleListRouter {
    weak var viewController: ArticleListViewController?

    func gotoArticleDetails(viewModel: ArticleCellViewModel) {
        if let splitVieController =  viewController?.splitViewController, let detailViewController = ArticleDetailsBuilder.viewController() as? ArticleDetailsViewController {
            detailViewController.viewModel = viewModel
            splitVieController.showDetailViewController(detailViewController, sender: viewController)
        }
    }
}
