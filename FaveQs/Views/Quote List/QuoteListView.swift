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
			.navigationTitle("Quotes List")
		}
		.task {
			viewModel.getQuotes(page: 1)
		}
	}
}

struct QuoteListView_Previews: PreviewProvider {
	static var previews: some View {
		QuoteListView()
	}
}
