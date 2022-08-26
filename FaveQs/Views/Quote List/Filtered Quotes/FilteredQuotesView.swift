//
//  FilteredQuotesView.swift
//  FaveQs
//
//  Created by Momeks on 8/26/22.
//

import SwiftUI

struct FilteredQuotesView: View {
	
	private let layout = [GridItem(.adaptive(minimum: 170), spacing: 10)]
	@Environment(\.presentationMode) var presentationMode
	@ObservedObject var viewModel = QuoteViewModel()
	var filter: String

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
		viewModel.getQuotes(page: 1, filter: filter, type: .tag, refreshable: true)
	}
}

struct FilteredQuotesView_Previews: PreviewProvider {
    static var previews: some View {
		FilteredQuotesView(filter: "good")
    }
}
