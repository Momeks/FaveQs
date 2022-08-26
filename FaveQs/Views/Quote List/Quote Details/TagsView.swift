//
//  TagsView.swift
//  FaveQs
//
//  Created by Momeks on 8/24/22.
//

import SwiftUI

struct TagsView: View {

	var tags: Array<String>
	private let layout = [GridItem(.adaptive(minimum: 200))]
	
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
							ForEach(tags, id: \.self) { tag in
								Button(tag) {
									print(tag)
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
	
	internal init(tags: Array<String>) {
		self.tags = tags
	}
}

struct TagsView_Previews: PreviewProvider {
	static var previews: some View {
		TagsView(tags: ["Love","Nature","Happy"])
	}
}
