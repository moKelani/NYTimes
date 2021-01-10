//
//  ArticleListRouter.swift
//  NYTimes
//
//  Created by Mohamed Kelany on 09/01/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

class ArticleListRouter {
    weak var viewController: ArticleListViewController?

    func gotoArticleDetails() {
        if let splitVieController =  viewController?.splitViewController, let detailViewController = splitVieController.viewControllers[1] as? ArticleDetailsViewController {
           // ArticleDetailsBuilder.viewController(article: viewController.viewmode)
           // detailVC.name?.text = list[indexPath.row].name + " (\(list[indexPath.row].code))"
        }
    }
}
