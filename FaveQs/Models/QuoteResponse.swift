//
//  QuoteResponse.swift
//  FaveQs
//
//  Created by Momeks on 8/25/22.
//

import Foundation

struct QuoteResponse: Codable {
	let page: Int
	let lastPage: Bool
	let quotes: [Quote]

	enum CodingKeys: String, CodingKey {
		case lastPage = "last_page"
		case page
		case quotes
	}
}
