//
//  Quote.swift
//  FaveQs
//
//  Created by Momeks on 8/25/22.
//

import Foundation

// MARK: - Quote
struct Quote: Codable {
	let id, favoritesCount: Int
	let dialogue, favorite: Bool
	let tags: [String]
	let url: String
	let upvotesCount, downvotesCount: Int
	let author, authorPermalink, body: String
	
	enum CodingKeys: String, CodingKey {
		case id
		case favoritesCount = "favorites_count"
		case dialogue, favorite, tags, url
		case upvotesCount = "upvotes_count"
		case downvotesCount = "downvotes_count"
		case author
		case authorPermalink = "author_permalink"
		case body
	}
}

// MARK: - QuoteResponse
struct QuoteResponse: Codable {
	let qotdDate: String
	let quote: Quote

	enum CodingKeys: String, CodingKey {
		case qotdDate = "qotd_date"
		case quote
	}
}
