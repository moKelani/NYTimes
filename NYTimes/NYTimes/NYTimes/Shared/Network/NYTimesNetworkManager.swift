//
//  NYTimesNetworkLayer.swift
//  NYTimes
//
//  Created by Mohamed Kelany on 09/01/2021.
//

//import Moya
//
//protocol Networkable {
//    var provider: MoyaProvider<API> { get }
//
//    func fetchPopularArticles(completion: @escaping (Result<PopularResult, Error>) -> ())
//    func fetchArticleDetail(articleId: String, completion: @escaping (Result<Article, Error>) -> ())
//}
//
//class NetworkManager: Networkable {
//    var provider = MoyaProvider<API>(plugins: [NetworkLoggerPlugin()])
//
//    func fetchPopularArticles(completion: @escaping (Result<PopularResult, Error>) -> ()) {
//        request(target: .popular(days: 1), completion: completion)
//    }
//
//    func fetchArticleDetail(articleId: String, completion: @escaping (Result<Article, Error>) -> ()) {
//        request(target: .article(id: articleId), completion: completion)
//    }
//}
//
//private extension NetworkManager {
//    private func request<T: Decodable>(target: API, completion: @escaping (Result<T, Error>) -> ()) {
//        provider.request(target) { result in
//            switch result {
//            case let .success(response):
//                do {
//                    let results = try JSONDecoder().decode(T.self, from: response.data)
//                    completion(.success(results))
//                } catch let error {
//                    completion(.failure(error))
//                }
//            case let .failure(error):
//                completion(.failure(error))
//            }
//        }
//    }
//}

import RxSwift
import Moya

protocol NYNetworkable {
    var provider: MoyaProvider<API> { get }
    func getPopularArticleList() -> Single<[Article]>
}

class NYNetworkManager: NYNetworkable {
    
    let provider:MoyaProvider<API>
    
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

            provider = MoyaProvider<API>(plugins: [NetworkLoggerPlugin(configuration: .init(formatter: .init(responseData: JSONResponseDataFormatter),
                                                                                                         logOptions: .verbose))])

        }


    func getPopularArticleList() -> Single<[Article]> {
        return provider.rx
            .request(.popular(days: 1))
            .filterSuccessfulStatusAndRedirectCodes()
            .map([Article].self)
    }
    
   
    
}
