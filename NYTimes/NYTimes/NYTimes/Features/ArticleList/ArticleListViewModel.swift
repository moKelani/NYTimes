//
//  ArticleListViewModel.swift
//  NYTimes
//
//  Created by Mohamed Kelany on 09/01/2021.
//  Copyright (c) 2021 com.kelany. All rights reserved.
//

import RxSwift
import Moya
import RxCocoa

class ArticleListViewModel {

    // input

    private var articleDataSource: BehaviorRelay<[ArticleCellViewModel]> = BehaviorRelay(value: [])
    private var isRechable = BehaviorRelay<Bool>(value: false)
    private let isLoading = BehaviorRelay(value: false)
    private let alertMessage = PublishSubject<AlertMessage>()

    // output

    // internal

    var onLoading: Observable<Bool> {
        isLoading.asObservable()
            .distinctUntilChanged()
    }

    var onAlertMessage: Observable<AlertMessage> {
        alertMessage.asObservable()

    }

    public var dataSourceDriver: Driver<[ArticleCellViewModel]> {
        return articleDataSource.asDriver().skip(1)
    }
    public var dataSource: [ArticleCellViewModel] {
        return articleDataSource.value
    }

    init() {
       setupRx()
    }

    func fetchArticles() {
        guard  !Reachability.shared.isConnected else {
            alertMessage.onNext(AlertMessage(title: "No Internet Connection", message: "You aren't connected to internet"))
            return
        }
        let networkManager: NYNetworkManager = NYNetworkManager()
        let observable = networkManager.getPopularArticleList().asObservable()
        isLoading.accept(true)
        _ = observable.subscribe(onNext: { [weak self] response in
            self?.isLoading.accept(false)
            guard let `self` = self, let articles = response.results else { return }
            var newArray = self.articleDataSource.value
            newArray.append(contentsOf: articles.map { ArticleCellViewModel(article: $0) })
            self.articleDataSource.accept(newArray)
        }, onError: { (_) in
            self.alertMessage.onNext(AlertMessage(title: "No Data Coming", message: "Something Went wrong"))
        })
    }

}

// MARK: Setup
private extension ArticleListViewModel {
    func setupRx() {
    }
}
