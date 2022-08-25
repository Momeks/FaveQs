//
//  RandomQouteView.swift
//  FaveQs
//
//  Created by Momeks on 8/24/22.
//

import SwiftUI

struct RandomQuoteView: View {
	var body: some View {
		VStack {
			NavigationTitle(text: "Random Quote")
			Spacer()
			VStack(spacing: 40) {
				Text("“My heart, which is so full to overflowing, has often been solaced and refreshed by music when sick and weary.”")
					.font(.system(size: 31, weight: .regular, design: .serif))
					.fixedSize(horizontal: false, vertical: true)

				HStack {
					Spacer()
					Text("— Martin Luther")
						.font(.system(size: 19, weight: .bold, design: .serif))
						.foregroundColor(.secondary)
				}
			}
			.padding(30)
			VStack(spacing: 15) {
				FaveButton()
				TagsView()
			}
			Spacer()
		}
	}
}

struct RandomQouteView_Previews: PreviewProvider {
	static var previews: some View {
		RandomQuoteView()
	}
}
