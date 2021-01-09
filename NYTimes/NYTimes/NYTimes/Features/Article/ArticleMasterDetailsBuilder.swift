//
//  ArticleMasterDetailsBuilder.swift
//  NYTimes
//
//  Created by Mohamed Kelany on 09/01/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

struct ArticleMasterDetailsBuilder {

    static func viewController() -> UIViewController {
        let viewModel = ArticleMasterDetailsViewModel()
        let router = ArticleMasterDetailsRouter()
        let articleMDViewController = ArticleMasterDetailsViewController(withViewModel: viewModel, router: router)
        router.viewController = articleMDViewController
        
        let masterController = ArticleListBuilder.viewController()
        let navigationMaster = UINavigationController(rootViewController: masterController)

        let detailController = ArticleDetailsBuilder.viewController()
        let navigationDetail = UINavigationController(rootViewController: detailController)
        articleMDViewController.viewControllers = [navigationMaster, navigationDetail]
        articleMDViewController.preferredDisplayMode = .oneBesideSecondary

       

        return articleMDViewController
    }
}
