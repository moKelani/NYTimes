//
//  APIServiceMocksUp.swift
//  NYTimesTests
//
//  Created by Mohamed Kelany on 10/01/2021.
//

import Foundation
import RxSwift
import Moya

@testable import NYTimes

class APIServiceMocksUp: NYNetworkable {
    var provider: MoyaProvider<NYTime>

    var fetchPopularArticlesIsCalled = false

    init(provider: MoyaProvider<NYTime> = MoyaProvider<NYTime>() ) {
        self.provider = provider
    }

    func getPopularArticleList() -> Single<PopularResult> {
        provider = MoyaProvider<NYTime>()
        fetchPopularArticlesIsCalled = true
        return provider.rx.request(.popular(days: 7)).filterSuccessfulStatusAndRedirectCodes().map(PopularResult.self)
    }

}
