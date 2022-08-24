//
//  TagsView.swift
//  FaveQs
//
//  Created by Momeks on 8/24/22.
//

import SwiftUI

struct TagsView: View {
	
	private var tags = ["love", "nature","love", "nature"]
	private var layout = [GridItem(.fixed(30))]

	var body: some View {
		GeometryReader { geo in
			HStack(alignment: .center) {
				
				Image(systemName: "tag.fill")
				Text("Tags:")
					.font(.callout.bold())
			
				ScrollView(.horizontal, showsIndicators: false) {
					LazyHGrid(rows: layout) {
						ForEach(tags, id: \.self) {
							Button("\($0)") {
					
							}
							.font(.callout.bold())
							.foregroundColor(.FQBlue)
							.buttonStyle(FQButtonStyle())
						}
					}
				}
			}
			.frame(height: 10)
			.padding()
		}
	}
}

struct TagsView_Previews: PreviewProvider {
	static var previews: some View {
		TagsView()
	}
}
