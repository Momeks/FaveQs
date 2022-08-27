//
//  TagsView.swift
//  FaveQs
//
//  Created by Momeks on 8/24/22.
//

import SwiftUI

struct TagsView: View {
	
	var tags: Array<String>
	private let layout = [GridItem(.adaptive(minimum: 100))]
	@State private var getTag = ""
	
	var body: some View {
		GeometryReader { geo in
			HStack {
				HStack(alignment: .center) {
					Image(systemName: "tag").imageScale(.large)
						.foregroundColor(.FQBlue)
					Text("Tags:")
					ScrollView(.horizontal, showsIndicators: false) {
						LazyHGrid(rows: layout) {
							ForEach(tags, id: \.self) { tag in
								Button(tag) {
									getTag = tag
								}
								.font(.body.bold())
								.buttonStyle(FQButtonStyle())
								.frame(height: 30, alignment: .leading)
							}
						}
					}
				}
				.frame(width: geo.size.width, height: 30, alignment: .center)
			}
		}
		.onChange(of: getTag) { value in
			NotificationCenter.default.post(name: .ongGetTag, object: value) 
		}
	}
	
	internal init(tags: Array<String>) {
		self.tags = tags
	}
}

struct TagsView_Previews: PreviewProvider {
	static var previews: some View {
		TagsView(tags: ["Love", "men", "test"])
	}
}
