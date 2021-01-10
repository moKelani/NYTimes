//
//  NYTimesNetworkLayer.swift
//  NYTimes
//
//  Created by Mohamed Kelany on 09/01/2021.
//

import RxSwift
import Moya

protocol NYNetworkable {
    var provider: MoyaProvider<NYTime> { get }
    func getPopularArticleList() -> Single<PopularResult>
}

class NYNetworkManager: NYNetworkable {

    let provider: MoyaProvider<NYTime>

    init() {
            func JSONResponseDataFormatter(_ data: Data) -> String {
                do {
                    let dataAsJSON = try JSONSerialization.jsonObject(with: data)
                    let prettyData = try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
                    return String(data: prettyData, encoding: .utf8) ?? String(data: data, encoding: .utf8) ?? ""
                } catch {
                    return String(data: data, encoding: .utf8) ?? ""
                }
            }

            provider = MoyaProvider<NYTime>(plugins: [NetworkLoggerPlugin(configuration: .init(formatter: .init(responseData: JSONResponseDataFormatter),
                                                                                                         logOptions: .verbose))])

        }

    func getPopularArticleList() -> Single<PopularResult> {
        return provider.rx
            .request(.popular(days: 1))
            .filterSuccessfulStatusAndRedirectCodes()
            .map(PopularResult.self)
    }

}
