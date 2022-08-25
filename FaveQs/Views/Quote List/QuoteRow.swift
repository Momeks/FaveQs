//
//  QuoteRow.swift
//  FaveQs
//
//  Created by Momeks on 8/24/22.
//

import SwiftUI

struct QuoteRow: View {
	//	var text: String
	//	var author: String
	//	var id: Int
	private var text = "Never let your schooling interfere with your education."
	
	var body: some View {
		Button {
			
		} label: {
			RoundedRectangle(cornerRadius: 15)
				.foregroundColor(.gray.opacity(0.2))
				.overlay {
					VStack(alignment: .leading, spacing: 3) {
						HStack(spacing: 3) {
							Image(systemName: "heart.fill")
								.imageScale(.small)
								.foregroundColor(.FQBlue)
							Text("8")
								.font(.footnote.bold())
								.foregroundColor(.FQBlue)
							Spacer()
						}
						Text(text)
							.font(.system(size: 17, weight: .regular, design: .serif))
						Spacer()
						HStack {
							Spacer()
							Text("— Martin Luther")
								.font(.system(size: 13, weight: .bold, design: .serif))
								.foregroundColor(.primary.opacity(0.7))
						}
					}
					.padding(.all)
				}
		}
		.buttonStyle(FQButtonStyle())
		.frame(width: 170, height: 170)
	}
}


//
//struct QuoteRow_Previews: PreviewProvider {
//	static var previews: some View {
//		QuoteRow()
//	}
//}
//


