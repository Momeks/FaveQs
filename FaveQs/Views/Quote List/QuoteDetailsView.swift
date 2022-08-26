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
		ScrollView(showsIndicators: false) {
			VStack {
				Spacer()
				VStack(spacing: 10) {
					
					//up-down votes and favorites count
					HStack {
						HStack {
							Image(systemName: "arrow.up")
								.font(Font.system(size: 16, weight: .medium))
							Text("\(quote.upvotesCount)")
								.font(.callout)
						}
						Divider()
						HStack {
							Image(systemName: "arrow.down")
								.font(Font.system(size: 16, weight: .medium))
							Text("\(quote.downvotesCount)")
								.font(.callout)
						}
						Spacer()
						HStack {
							Image(systemName: "heart.fill")
								.font(Font.system(size: 16, weight: .medium))
							Text("\(quote.favoritesCount)")
								.font(.callout)
						}
					}
					.foregroundColor(.secondary)
					Divider()
					
					//quoutation
					Text("“\(quote.body)”")
						.font(.system(size: 31, weight: .regular, design: .serif))
						.fixedSize(horizontal: false, vertical: true)
						.multilineTextAlignment(.leading)
					
					//author
					HStack {
						Spacer()
						Text("— \(quote.author)")
							.font(.system(size: 19, weight: .bold, design: .serif))
							.foregroundColor(.secondary)
							.multilineTextAlignment(.trailing)
					}
				}
				.padding(30)
				
				//Fave buttons and tags
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
}

struct QuoteDetailsView_Previews: PreviewProvider {
	static var previews: some View {
		QuoteDetailsView(quote: Quote(id: 26637, dialogue: false, quotePrivate: false, tags: ["nature","love"], url: "https://favqs.com/quotes/ralph-waldo-emerson/26637-the-highest-r-", favoritesCount: 2, upvotesCount: 1, downvotesCount: 0, author: "Ralph Waldo Emerson", authorPermalink: "ralph-waldo-emerson", body: "The highest revelation is that God is in every man.", source: nil, context: nil))
	}
}
