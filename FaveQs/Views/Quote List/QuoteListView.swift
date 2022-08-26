//
//  QuoteListView.swift
//  FaveQs
//
//  Created by Momeks on 8/24/22.
//

import SwiftUI

struct QuoteListView: View {
	
	private let layout = [GridItem(.adaptive(minimum: 170), spacing: 10)]
	@ObservedObject var viewModel = QuoteViewModel()
	@State private var currentPage = 1
	@State private var searchText = ""
	
	var body: some View {
		NavigationView {
			ScrollView(.vertical, showsIndicators: true) {
				LazyVGrid(columns: layout, spacing: 10) {
					ForEach(viewModel.quotes, id:\.self) { quote in
						NavigationLink {
							QuoteDetailsView(quote: quote, hideTags: false)
						} label: {
							QuoteRow(quote: quote)
						}
						.buttonStyle(FQButtonStyle())
					}
				}
				.padding(.horizontal)
			}
			.navigationTitle("Quotes List")
			.searchable(text: $searchText)
			.onSubmit(of: .search) {
				viewModel.getQuotes(page: 1, filter: searchText, refreshable: true)
			}
		}
		.navigationViewStyle(.stack)
		.overlay {
			HUDView()
				.opacity(viewModel.isLoading ? 1.0 : 0.0)
				.animation(.linear, value: viewModel.isLoading)
		}
	}
	
	init() {
		viewModel.getQuotes(page: currentPage)
	}
}

struct QuoteListView_Previews: PreviewProvider {
	static var previews: some View {
		QuoteListView()
	}
}
