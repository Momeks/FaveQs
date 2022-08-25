//
//  QuoteListView.swift
//  FaveQs
//
//  Created by Momeks on 8/24/22.
//

import SwiftUI

struct QuoteListView: View {
	
	private var layout: [GridItem] {
		Array(repeating: .init(.adaptive(minimum: 150, maximum: 200)), count: 2)
	}
	
	var body: some View {
		ScrollView(.vertical, showsIndicators: true) {
			LazyVGrid(columns: layout, spacing: 10) {
				ForEach(0..<20) { item in
					QuoteRow()
				}
			}
			.padding(.horizontal)
		}
	}
}

struct QuoteListView_Previews: PreviewProvider {
	static var previews: some View {
		QuoteListView()
	}
}
