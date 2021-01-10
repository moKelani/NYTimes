//
//  NYTimeViewModel.swift
//  NYTimesTests
//
//  Created by Mohamed Kelany on 10/01/2021.
//

import XCTest
import RxSwift
import Moya

@testable import NYTimes

class NYTimeViewModel: XCTestCase {

    var bag: DisposeBag?
    var apiServiceMockup: APIServiceMocksUp?

    override func setUp() {
        bag = DisposeBag()
        apiServiceMockup = APIServiceMocksUp()
    }

    override func tearDown() {
        bag = nil
    }

    func testViewModel() {

        var sut: ArticleCellViewModel!

        let observable = apiServiceMockup?.getPopularArticleList().asObservable()
        _ = observable?.subscribe(onNext: { response in
            guard let articles = response.results else { return }
            sut = articles.map { ArticleCellViewModel(article: $0) }.first

           _ = sut.articleTitle.drive(onNext: { (articleTitle) in
                XCTAssertEqual(articleTitle, "Indonesian Jetliner Crashes Into the Sea After Takeoff, Carrying 62")
            })

           _ = sut.articlePublishDate.drive(onNext: { (articlePublishDate) in
                XCTAssertEqual(articlePublishDate, "2021-01-09")
            })

        }).disposed(by: bag!)

    }

}
