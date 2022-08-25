//
//  TagsView.swift
//  FaveQs
//
//  Created by Momeks on 8/24/22.
//

import SwiftUI

struct TagsView: View {
	
	private var tags = ["love", "nature","world"]
	private var layout = [GridItem(.fixed(30))]
	
	var body: some View {
		HStack {
			Spacer()
			GeometryReader { geo in
				ScrollView(.horizontal, showsIndicators: false) {
					HStack(alignment: .center) {
						Image(systemName: "tag.fill")
						Text("Tags:")
							.font(.callout.bold())
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
					.frame(width: geo.size.width, height: 30, alignment: .center)
				}
				Spacer()
			}
		}
	}
}

struct TagsView_Previews: PreviewProvider {
	static var previews: some View {
		TagsView()
	}
}
