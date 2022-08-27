//
//  FavoritesView.swift
//  FaveQs
//
//  Created by Momeks on 8/27/22.
//

import SwiftUI

struct FavoritesView: View {
	
	@State private var loginViewPresented = false
	@State private var userViewPresented = false
	@Environment(\.managedObjectContext) var moc
	@FetchRequest(sortDescriptors: [ SortDescriptor(\.id, order: .reverse)]) var favorites: FetchedResults<Favorites>
	private let layout = [GridItem(.adaptive(minimum: 150), spacing: 20)]
	private var quote: Quote!
	
	var body: some View {
		NavigationView {
			ScrollView(.vertical, showsIndicators: true) {
				LazyVGrid(columns: layout, spacing: 15) {
					ForEach(favorites) { favorites in
						NavigationLink {
							QuoteDetailsView(quote: Quote(id: Int(favorites.id), dialogue: false, quotePrivate: false, tags: [], url: "", favoritesCount: Int(favorites.favoritesCount), upvotesCount: Int(favorites.upvotesCount), downvotesCount: Int(favorites.downvotesCount), author: favorites.author ?? "", authorPermalink: "", body: favorites.body ?? "", source: "", context: ""), hideTags: true)
						} label: {
							QuoteRow(quote: Quote(id: Int(favorites.id), dialogue: false, quotePrivate: false, tags: [], url: "", favoritesCount: Int(favorites.favoritesCount), upvotesCount: Int(favorites.upvotesCount), downvotesCount: Int(favorites.downvotesCount), author: favorites.author ?? "", authorPermalink: "", body: favorites.body ?? "", source: "", context: ""))
						}
						.buttonStyle(FQButtonStyle())
					}
				}
				.padding(.horizontal)
			}
			.navigationTitle("Favorites")
			.toolbar {
				Button {
					AppDefaults.shared.isUserLogin() ? userViewPresented.toggle() : loginViewPresented.toggle()
				} label: {
					Image(systemName: "person.crop.circle")
				}
			}
		}
		.overlay {
			if favorites.isEmpty {
				Text("No Favorite Quotes")
					.font(.callout.bold())
			}
		}
		.navigationViewStyle(.stack)
		.sheet(isPresented: $loginViewPresented) {
			LoginView()
		}
		.alert("Hello \(AppDefaults.shared.userName())", isPresented: $userViewPresented, actions: {
			Button("OK", role: .cancel, action: {})
		})
	}
	
	
}

struct FavoritesView_Previews: PreviewProvider {
	static var previews: some View {
		FavoritesView()
	}
}
