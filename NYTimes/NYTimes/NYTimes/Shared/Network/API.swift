//
//  API.swift
//  NYTimes
//
//  Created by Mohamed Kelany on 09/01/2021.
//

import Moya


//let NYTimesAPIProvider = MoyaProvider<API>(plugins: [NetworkLoggerPlugin(configuration: .init())])

enum API {
    case popular(days: Int)
    case article(id: String)
}

extension API: TargetType {
    var sampleData: Data {
        Data()
    }
    
    var baseURL: URL {
        guard let url = URL(string: "https://api.nytimes.com/svc/mostpopular/v2/viewed/") else { fatalError() }
        return url
    }
    
    var path: String {
        switch self {
        case .popular(let days):
            return "\(days).json"
        case .article(let id):
            return "movie/\(id)"
        }
    }
    
    var method: Method {
        return .get
    }
    
    
    var task: Task {
        switch self {
        case .popular, .article:
            return .requestParameters(parameters: ["api-key": "okLXjggS88pynwAFspFnYdMomYrx5xCc"], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }

    public var validationType: ValidationType {
        return .successCodes
    }
    
//    public var authorizationType: AuthorizationType? {
//        return .targetDoesNotNeedAuth
//    }
    
//    var sampleData: Data {
//        switch self {
//        case .popular(let page):
//            return stubbedResponse("Feed\(page)")
//        case .article:
//            return stubbedResponse("UserVideoList")
//
//        }
//    }
    
//    func stubbedResponse(_ filename: String) -> Data {
//            guard FileManager.fileExistInMainBundle(fileName: "\(filename).json") else { return Data([]) }
//            guard let path = Bundle.main.url(forResource: filename, withExtension: "json") else { return Data([]) }
//            guard let data = try? Data(contentsOf: path) else { return Data([]) }
//            return data
//        }
}
