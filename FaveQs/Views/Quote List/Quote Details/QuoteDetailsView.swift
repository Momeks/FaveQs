//
//  QuoteDetailsView.swift
//  FaveQs
//
//  Created by Momeks on 8/25/22.
//

import SwiftUI

struct QuoteDetailsView: View {
	
	var quote: Quote
	var hideTags: Bool
	
	@State private var isPresented = false
	@State private var activityPresented = false
	@State private var items: [Any] = []
	@ObservedObject private var tagModel = TagViewModel()
	@Environment(\.managedObjectContext) var moc
	@FetchRequest(sortDescriptors: [ SortDescriptor(\.id, order: .reverse)]) var favorites: FetchedResults<Favorites>
	 
	var body: some View {
		ScrollView(showsIndicators: false) {
			VStack(alignment: .leading) {
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
					
					VStack(spacing: 30) {
						//quotation
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
				}
				.padding(30)
				
				//Fave buttons and tags
				VStack(alignment: .leading, spacing: 15) {
					ActionButton(image: isAddedToFavorite() ? "heart.slash" : "heart", title: isAddedToFavorite() ? "Remove from favorite " : "Fave it") {
						if isAddedToFavorite() {
							deleteFromFavorites(quote.id)
						} else {
							addToFavorites()
						}
					}
					
					Divider()
					
					ActionButton(image: "square.and.arrow.up", title: "Share") {
						let quoteToShare = "“\(quote.body)”\n— \(quote.author)"
						items = [quoteToShare]
						activityPresented.toggle()
					}
					
					Divider()
					
					if !quote.tags.isEmpty && hideTags == false {
						TagsView(tags: quote.tags)
					}
				}
				.padding()
				Spacer()
			}
		}
		.onReceive(NotificationCenter.default.publisher(for: .ongGetTag), perform: { notification in
			DispatchQueue.main.async {
				self.isPresented.toggle()
			}
			if let tag = notification.object as? String {
				tagModel.tag = tag
			}
		})
		.sheet(isPresented: $isPresented) {
			FilteredQuotesView(filter: tagModel.tag)
		}
		.sheet(isPresented: $activityPresented) {
			ActivityViewController(activityItems: $items)
		}
	}
}

//MARK: - Core Data
extension QuoteDetailsView {
	func addToFavorites() {
		let favorites = Favorites(context: moc)
		favorites.id = Int64(quote.id)
		favorites.body = quote.body
		favorites.author = quote.author
		favorites.upvotesCount = Int16(quote.upvotesCount)
		favorites.downvotesCount = Int16(quote.downvotesCount)
		favorites.favoritesCount = Int16(quote.favoritesCount)
		try? moc.save()
	}
	
	func deleteFromFavorites(_ id: Int) {
		let madIDs = favorites.map { $0.id }
		guard let index = madIDs.firstIndex(of: Int64(quote.id)) else { return }
		moc.delete(favorites[index])
		try? moc.save()
	}
	
	func isAddedToFavorite() -> Bool {
		let mapIDs = favorites.map { $0.id }
		guard let index = mapIDs.firstIndex(of: Int64(quote.id))  else { return false }
		let faveID = mapIDs[index]
		if quote.id == faveID   {
			return true
		} else {
			return false
		}
	}
}

//MARK: - Previews
struct QuoteDetailsView_Previews: PreviewProvider {
	static var previews: some View {
		QuoteDetailsView(quote: Quote(id: 26637, dialogue: false, quotePrivate: false, tags: ["nature","love"], url: "https://favqs.com/quotes/ralph-waldo-emerson/26637-the-highest-r-", favoritesCount: 2, upvotesCount: 1, downvotesCount: 0, author: "Ralph Waldo Emerson", authorPermalink: "ralph-waldo-emerson", body: "The highest revelation is that God is in every man.", source: nil, context: nil), hideTags: false)
	}
}
