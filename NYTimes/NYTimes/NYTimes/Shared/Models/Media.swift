//
//  Article.swift
//  NYTimes
//
//  Created by Mohamed Kelany on 09/01/2021.
//

import Foundation
struct Media: Codable {
	let type: String?
	let subtype: String?
	let caption: String?
	let copyright: String?
	let approvedForSyndication: Int?
	let metadata: [Metadata]?

	enum CodingKeys: String, CodingKey {

		case type = "type"
		case subtype = "subtype"
		case caption = "caption"
		case copyright = "copyright"
		case approvedForSyndication = "approved_for_syndication"
		case metadata = "media-metadata"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		subtype = try values.decodeIfPresent(String.self, forKey: .subtype)
		caption = try values.decodeIfPresent(String.self, forKey: .caption)
		copyright = try values.decodeIfPresent(String.self, forKey: .copyright)
        approvedForSyndication = try values.decodeIfPresent(Int.self, forKey: .approvedForSyndication)
        metadata = try values.decodeIfPresent([Metadata].self, forKey: .metadata)
	}

}
