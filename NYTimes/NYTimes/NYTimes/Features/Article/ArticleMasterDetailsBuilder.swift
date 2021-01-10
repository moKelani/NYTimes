//
//  ArticleMasterDetailsBuilder.swift
//  NYTimes
//
//  Created by Mohamed Kelany on 09/01/2021.
//  Copyright (c) 2021 com.kelany. All rights reserved.
//

import UIKit

struct ArticleMasterDetailsBuilder {

    static func viewController() -> UIViewController {
        let articleMDViewController = ArticleMasterDetailsViewController()
        
        let masterController = ArticleListBuilder.viewController()
        let navigationMaster = UINavigationController(rootViewController: masterController)

        let detailController = ArticleDetailsBuilder.viewController()
        let navigationDetail = UINavigationController(rootViewController: detailController)
        articleMDViewController.viewControllers = [navigationMaster, navigationDetail]
        articleMDViewController.preferredDisplayMode = .oneBesideSecondary

       

        return articleMDViewController
    }
}
