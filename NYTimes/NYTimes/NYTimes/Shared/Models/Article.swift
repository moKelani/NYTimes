//
//  Article.swift
//  NYTimes
//
//  Created by Mohamed Kelany on 09/01/2021.
//

import Foundation

struct PopularResult: Codable {
    let status: String?
    let copyright: String?
    let numResults: Int?
    let results: [Article]?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case copyright = "copyright"
        case numResults = "num_results"
        case results = "results"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        copyright = try values.decodeIfPresent(String.self, forKey: .copyright)
        numResults = try values.decodeIfPresent(Int.self, forKey: .numResults)
        results = try values.decodeIfPresent([Article].self, forKey: .results)
    }

}
