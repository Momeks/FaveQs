//
//  QuoteDetailsView.swift
//  FaveQs
//
//  Created by Momeks on 8/25/22.
//

import SwiftUI

struct QuoteDetailsView: View {
	var quote: Quote
	
	var body: some View {
		VStack {
			Spacer()
			VStack(spacing: 40) {
				Text("“\(quote.body)”")
					.font(.system(size: 31, weight: .regular, design: .serif))
					.fixedSize(horizontal: false, vertical: true)
				
				HStack {
					Spacer()
					Text("— \(quote.author)")
						.font(.system(size: 19, weight: .bold, design: .serif))
						.foregroundColor(.secondary)
				}
			}
			.padding(30)
			VStack(spacing: 15) {
				FaveButton()
				if !quote.tags.isEmpty {
					TagsView(tags: quote.tags)
						.frame(height: 30)
				}
			}
			Spacer()
		}
	}
}

struct QuoteDetailsView_Previews: PreviewProvider {
	static var previews: some View {
		QuoteDetailsView(quote: Quote(id: 26637, dialogue: false, quotePrivate: false, tags: ["nature","love"], url: "https://favqs.com/quotes/ralph-waldo-emerson/26637-the-highest-r-", favoritesCount: 2, upvotesCount: 1, downvotesCount: 0, author: "Ralph Waldo Emerson", authorPermalink: "ralph-waldo-emerson", body: "The highest revelation is that God is in every man.", source: nil, context: nil))
	}
}
