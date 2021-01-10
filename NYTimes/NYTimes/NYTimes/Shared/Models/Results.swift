//
//  Article.swift
//  NYTimes
//
//  Created by Mohamed Kelany on 09/01/2021.
//

import Foundation
struct Article: Codable {
	let uri: String?
	let url: String?
	let id: Int?
	let assetId: Int?
	let source: String?
	let publishedDate: String?
	let updated: String?
	let section: String?
	let subsection: String?
	let nytdsection: String?
	let adxKeywordswords: String?
	let column: String?
	let byline: String?
	let type: String?
	let title: String?
	let abstract: String?
	let desFacet: [String]?
	let orgFacet: [String]?
	let perFacet: [String]?
	let geoFacet: [String]?
	let media: [Media]?
	let etaId: Int?

	enum CodingKeys: String, CodingKey {

		case uri = "uri"
		case url = "url"
		case id = "id"
		case assetId = "asset_id"
		case source = "source"
		case publishedDate = "published_date"
		case updated = "updated"
		case section = "section"
		case subsection = "subsection"
		case nytdsection = "nytdsection"
		case adxKeywordswords = "adx_keywords"
		case column = "column"
		case byline = "byline"
		case type = "type"
		case title = "title"
		case abstract = "abstract"
		case desFacet = "des_facet"
		case orgFacet = "org_facet"
		case perFacet = "per_facet"
		case geoFacet = "geo_facet"
		case media = "media"
		case etaId = "eta_id"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		uri = try values.decodeIfPresent(String.self, forKey: .uri)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
        assetId = try values.decodeIfPresent(Int.self, forKey: .assetId)
		source = try values.decodeIfPresent(String.self, forKey: .source)
        publishedDate = try values.decodeIfPresent(String.self, forKey: .publishedDate)
		updated = try values.decodeIfPresent(String.self, forKey: .updated)
		section = try values.decodeIfPresent(String.self, forKey: .section)
		subsection = try values.decodeIfPresent(String.self, forKey: .subsection)
		nytdsection = try values.decodeIfPresent(String.self, forKey: .nytdsection)
        adxKeywordswords = try values.decodeIfPresent(String.self, forKey: .adxKeywordswords)
		column = try values.decodeIfPresent(String.self, forKey: .column)
		byline = try values.decodeIfPresent(String.self, forKey: .byline)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		abstract = try values.decodeIfPresent(String.self, forKey: .abstract)
        desFacet = try values.decodeIfPresent([String].self, forKey: .desFacet)
        orgFacet = try values.decodeIfPresent([String].self, forKey: .orgFacet)
        perFacet = try values.decodeIfPresent([String].self, forKey: .perFacet)
        geoFacet = try values.decodeIfPresent([String].self, forKey: .geoFacet)
		media = try values.decodeIfPresent([Media].self, forKey: .media)
        etaId = try values.decodeIfPresent(Int.self, forKey: .etaId)
	}

}
