//
//  ArticleDetailsViewModel.swift
//  NYTimes
//
//  Created by Mohamed Kelany on 09/01/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import RxSwift
import Moya
class ArticleDetailsViewModel {

    // input
    private let article = PublishSubject<Article>()
    // output

    // internal
    
    var onComingArticle: Observable<Article> {
        article.asObservable()
    }

    init() {
        setupRx()
    }
}

// MARK: Setup
private extension ArticleDetailsViewModel {

    func setupRx() {

    }
    
   
}
