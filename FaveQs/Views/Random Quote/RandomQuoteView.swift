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
				
				if let quote = viewModel.quotes.first {
					VStack {
						Spacer()
						QuoteDetailsView(quote: quote)
							.animation(.easeInOut, value: !viewModel.isLoading)
					}
				}
				
				HUDView()
					.opacity(viewModel.isLoading ? 1.0 : 0.0)
					.animation(.linear, value: viewModel.isLoading)
			}
			.navigationTitle("Random Quote")
		}
		.navigationViewStyle(.stack)
		.task {
			getQuotes()
		}
		.alert(viewModel.alertTitle, isPresented: $viewModel.showAlert) {
			Button("Reload", role: .cancel) {
				getQuotes()
			}
		} message: {
			Text(viewModel.alertMessage)
		}
	}
	
	func getQuotes() {
		viewModel.getQuotes(page: Int.random(in: 1..<10))
	}
}

struct RandomQouteView_Previews: PreviewProvider {
	static var previews: some View {
		RandomQuoteView()
	}
}
