//
//  RandomQouteView.swift
//  FaveQs
//
//  Created by Momeks on 8/24/22.
//

import SwiftUI

struct RandomQuoteView: View {
	
	@ObservedObject var viewModel = QuoteViewModel()
	
	var body: some View {
		NavigationView {
			ZStack(alignment: .center) {
				ProgressView()
					.progressViewStyle(.circular)
					.opacity(viewModel.quotes.isEmpty ? 1.0 : 0.0)
					.animation(.linear, value: viewModel.quotes.isEmpty)
				
				if let quote = viewModel.quotes.first {
					VStack {
						Spacer()
						QuoteDetailsView(quote: quote)
					}
				}
			}
			.navigationTitle("Random Quote")
		}
		.task {
			viewModel.getQuotes(page: Int.random(in: 1..<10))
		}
	}
}

struct RandomQouteView_Previews: PreviewProvider {
	static var previews: some View {
		RandomQuoteView()
	}
}
