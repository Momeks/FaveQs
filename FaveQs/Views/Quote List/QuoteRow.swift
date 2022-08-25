//
//  QuoteRow.swift
//  FaveQs
//
//  Created by Momeks on 8/24/22.
//

import SwiftUI

struct QuoteRow: View {
	
	var quote: Quote
	
	var body: some View {
		RoundedRectangle(cornerRadius: 15)
			.foregroundColor(.gray.opacity(0.2))
			.overlay {
				VStack(alignment: .leading, spacing: 3) {
					HStack(spacing: 3) {
						Image(systemName: "heart.fill")
							.imageScale(.small)
							.foregroundColor(.FQBlue)
						Text("\(quote.favoritesCount)")
							.font(.footnote.bold())
							.foregroundColor(.FQBlue)
						Spacer()
					}
					Text(quote.body)
						.font(.system(size: 17, weight: .regular, design: .serif))
						.foregroundColor(.primary)
						.multilineTextAlignment(.leading)
					Spacer()
					HStack {
						Spacer()
						Text("— \(quote.author)")
							.font(.system(size: 13, weight: .bold, design: .serif))
							.foregroundColor(.primary.opacity(0.7))
					}
				}
				.padding(.all)
			}
			.frame(width: 170, height: 170)
	}
}



struct QuoteRow_Previews: PreviewProvider {
	static var previews: some View {
		QuoteRow(quote: Quote(id: 26637, dialogue: false, quotePrivate: false, tags: ["nature","love"], url: "https://favqs.com/quotes/ralph-waldo-emerson/26637-the-highest-r-", favoritesCount: 2, upvotesCount: 1, downvotesCount: 0, author: "Ralph Waldo Emerson", authorPermalink: "ralph-waldo-emerson", body: "The highest revelation is that God is in every man.", source: nil, context: nil))
	}
}



