//
//  ArticleCellViewModel.swift
//  NYTimes
//
//  Created by Mohamed Kelany on 09/01/2021.
//

import UIKit
import RxSwift
import RxCocoa

class ArticleCellViewModel {
    var bag: DisposeBag = DisposeBag()
    
    private let article: BehaviorRelay<Article>
    
    init(article: Article) {
        self.article = BehaviorRelay(value: article)
    }
}


extension ArticleCellViewModel {
    
    public var articleDriver: Driver<Article> {
        return article.asDriver()
    }
    
    public var articleCover: Driver<URL?> {
        return articleDriver.map {
            guard let str = $0.media?.first?.metadata?[1].url else { return nil }
            return URL(string: str) ?? nil
            }.asDriver()
    }

    public var articleTitle: Driver<String> {
        return articleDriver.map {
            return ($0.title ?? "")
        }.asDriver()
    }

    public var articlePublishDate: Driver<String> {
        return articleDriver.map {
            return "\($0.publishedDate ?? "")"
        }.asDriver()
    }

}

