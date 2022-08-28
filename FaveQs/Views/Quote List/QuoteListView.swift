//
//  QuoteListView.swift
//  FaveQs
//
//  Created by Momeks on 8/24/22.
//

import SwiftUI

struct QuoteListView: View {
	
	private let layout = [GridItem(.adaptive(minimum: 150), spacing: 20)]
	@ObservedObject var viewModel = QuoteViewModel()
	@State private var currentPage = 1
	@State private var searchText = ""
	@State private var heightRatio = 2000.0
	
	var body: some View {
		NavigationView {
			ScrollView(.vertical, showsIndicators: true) {
				LazyVGrid(columns: layout, spacing: 15) {
					ForEach(viewModel.quotes, id:\.self) { quote in
						NavigationLink {
							QuoteDetailsView(quote: quote, hideTags: false)
						} label: {
							QuoteRow(quote: quote)
								.onAppear {
									if viewModel.quotes.last?.id == quote.id {
										DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
											self.currentPage += 1
											viewModel.getQuotes(page: currentPage, refreshable: false)
										})
									}
								}
						}
						.buttonStyle(FQButtonStyle())
					}
				}
				.padding(.horizontal)
			}
			.navigationTitle("Quotes List")
			.toolbar {
				Button {
					viewModel.getQuotes(page: currentPage, refreshable: true)
				} label: {
					Image(systemName: "arrow.clockwise")
						.foregroundColor(.FQBlue)
				}
			}
			.searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .automatic))
		}
		.navigationViewStyle(.stack)
		.onSubmit(of: .search) {
			viewModel.getQuotes(page: 1, filter: searchText, refreshable: true)
		}
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
