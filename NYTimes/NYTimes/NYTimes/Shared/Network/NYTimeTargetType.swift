//
//  NYTime.swift
//  NYTimes
//
//  Created by Mohamed Kelany on 09/01/2021.
//

import Moya

enum NYTime {
    case popular(days: Int)
}

extension NYTime: TargetType {

    var baseURL: URL {
        guard let url = URL(string: "https://api.nytimes.com/svc/mostpopular/v2/viewed/") else { fatalError() }
        return url
    }

    var path: String {
        switch self {
        case .popular(let days):
            return "\(days).json"
        }
    }

    var method: Method {
        return .get
    }

    var task: Task {
        return .requestParameters(parameters: ["api-key": "okLXjggS88pynwAFspFnYdMomYrx5xCc"], encoding: URLEncoding.queryString)
    }

    var headers: [String: String]? {
        return nil
    }

    public var validationType: ValidationType {
        return .successCodes
    }

    var sampleData: Data {
        return stubbedResponse("articleList")
    }

    func stubbedResponse(_ filename: String) -> Data {
            guard FileManager.fileExistInMainBundle(fileName: "\(filename).json") else { return Data([]) }
            guard let path = Bundle.main.url(forResource: filename, withExtension: "json") else { return Data([]) }
            guard let data = try? Data(contentsOf: path) else { return Data([]) }
            return data
        }
}
