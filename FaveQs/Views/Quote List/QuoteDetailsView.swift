//
//  QuoteDetailsView.swift
//  FaveQs
//
//  Created by Momeks on 8/25/22.
//

import SwiftUI

struct QuoteDetailsView: View {
	
	//MARK: - Variable
	var quote: Quote
	
	//MARK: - View
	var body: some View {
		VStack {
			Spacer()
			VStack(spacing: 40) {
				Text("“\(quote.body)”")
					.font(.system(size: 31, weight: .regular, design: .serif))
					.fixedSize(horizontal: false, vertical: true)
				
				HStack {
					Spacer()
					Text("— \(quote.author)")
						.font(.system(size: 19, weight: .bold, design: .serif))
						.foregroundColor(.secondary)
				}
			}
			.padding(30)
			VStack(spacing: 15) {
				FaveButton()
				TagsView(tags: quote.tags)
			}
			Spacer()
		}
	}
}


//struct QuoteDetailsView_Previews: PreviewProvider {
//	static var previews: some View {
//		QuoteDetailsView(quote: <#Quote#>)
//	}
//}
