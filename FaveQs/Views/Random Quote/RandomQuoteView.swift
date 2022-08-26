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
				
				if let quote = viewModel.quotes.shuffled().first {
					VStack {
						Spacer()
						QuoteDetailsView(quote: quote)
							.animation(.easeInOut, value: !viewModel.isLoading)
							.opacity(viewModel.isLoading ? 0.0 : 1.0)
					}
				}
				HUDView()
					.opacity(viewModel.isLoading ? 1.0 : 0.0)
					.animation(.linear, value: viewModel.isLoading)
			}
			.navigationTitle("Random Quote")
			.toolbar {
				Button {
					getRandomQuote()
				} label: {
					Image(systemName: "arrow.clockwise")
				}
			}
		}
		.navigationViewStyle(.stack)
		.alert(viewModel.alertTitle, isPresented: $viewModel.showAlert) {
			Button("Reload", role: .cancel) {
				getRandomQuote()
			}
		} message: {
			Text(viewModel.alertMessage)
		}
	}
	
	init() {
		getRandomQuote()
	}
}

//MARK: - Functions
extension RandomQuoteView {
	func getRandomQuote() {
		viewModel.getQuotes(page: Int.random(in: 1...10))
	}
}

struct RandomQouteView_Previews: PreviewProvider {
	static var previews: some View {
		RandomQuoteView()
	}
}
