//
//  Quote.swift
//  FaveQs
//
//  Created by Momeks on 8/25/22.
//

import Foundation

struct Quote: Codable, Hashable {
	let id: Int
	let dialogue, quotePrivate: Bool
	let tags: [String]
	let url: String
	let favoritesCount, upvotesCount, downvotesCount: Int
	let author, authorPermalink, body: String
	let source, context: String?

	enum CodingKeys: String, CodingKey {
		case id, dialogue
		case quotePrivate = "private"
		case tags, url
		case favoritesCount = "favorites_count"
		case upvotesCount = "upvotes_count"
		case downvotesCount = "downvotes_count"
		case author
		case authorPermalink = "author_permalink"
		case body, source, context
	}
}
