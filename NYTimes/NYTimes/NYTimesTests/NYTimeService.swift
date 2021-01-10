//
//  APIService.swift
//  NYTimesTests
//
//  Created by Mohamed Kelany on 10/01/2021.
//

import XCTest
import RxSwift
import Moya

@testable import NYTimes

class NYTimeService: XCTestCase {

    var sut: MoyaProvider<NYTime>!
    
    func localEndPoint(_ target: NYTime) -> Endpoint {
        return Endpoint(url: URL(target: target).absoluteString,
                        sampleResponseClosure: { .networkResponse(200, target.sampleData) },
                        method: target.method,
                        task: target.task,
                        httpHeaderFields: target.headers)
    }
    
    func getArticleList() {
        sut = MoyaProvider<NYTime>(endpointClosure: localEndPoint, stubClosure: MoyaProvider.delayedStub(2))
        sut.request(.popular(days: 7)) { (result) in
            if case let .success(response) = result {
                if response.statusCode == 200 {
                    XCTAssert(true)
                }
               
            } else {
                XCTAssert(false)
            }
        }
    }
    
    

}
