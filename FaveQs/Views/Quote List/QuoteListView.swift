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
	
	var body: some View {
		NavigationView {
			ScrollView(.vertical, showsIndicators: true) {
				LazyVGrid(columns: layout, spacing: 10) {
					ForEach(viewModel.quotes, id:\.self) { quote in
						NavigationLink {
							QuoteDetailsView(quote: quote)
						} label: {
							QuoteRow(quote: quote)
						}
						.buttonStyle(FQButtonStyle())
					}
				}
				.padding(.horizontal)
			}
			.navigationTitle("Random Quote")
		}
		.navigationViewStyle(.stack)
		.task {
			viewModel.getQuotes(page: currentPage)
		}
		.overlay {
			HUDView()
				.opacity(viewModel.isLoading ? 1.0 : 0.0)
				.animation(.linear, value: viewModel.isLoading)
		}
	}
}

struct QuoteListView_Previews: PreviewProvider {
	static var previews: some View {
		QuoteListView()
	}
}
