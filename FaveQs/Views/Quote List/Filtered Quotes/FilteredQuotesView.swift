//
//  FilteredQuotesView.swift
//  FaveQs
//
//  Created by Momeks on 8/26/22.
//

import SwiftUI

struct FilteredQuotesView: View {
	
	private let layout = [GridItem(.adaptive(minimum: 150), spacing: 20)]
	@Environment(\.presentationMode) var presentationMode
	@ObservedObject private var viewModel = QuoteViewModel()
	@State private var currentPage = 1
	var filter: String
	
	var body: some View {
		NavigationView {
			ScrollView(.vertical, showsIndicators: true) {
				LazyVGrid(columns: layout, spacing: 15) {
					ForEach(viewModel.quotes, id:\.self) { quote in
						NavigationLink {
							QuoteDetailsView(quote: quote, hideTags: true)
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
			.navigationTitle(filter)
			.toolbar {
				Button {
					presentationMode.wrappedValue.dismiss()
				} label: {
					Image(systemName: "xmark")
				}
			}
		}
		.navigationViewStyle(.stack)
		.overlay {
			HUDView()
				.opacity(viewModel.isLoading ? 1.0 : 0.0)
				.animation(.linear, value: viewModel.isLoading)
		}
	}
	
	init(filter: String) {
		self.filter = filter
		viewModel.getQuotes(page: currentPage, filter: filter, type: .tag, refreshable: true)
	}
}

struct FilteredQuotesView_Previews: PreviewProvider {
	static var previews: some View {
		FilteredQuotesView(filter: "good")
	}
}
