//
//  ActionButton.swift
//  FaveQs
//
//  Created by Momeks on 8/26/22.
//

import SwiftUI

struct ActionButton: View {
	
	var image: String
	var title: String
	var action: (() -> Void)?
	
	var body: some View {
		Button {
			action?()
		} label: {
			HStack {
				Image(systemName: image)
				Text(title)
					.font(.callout.bold())
					.foregroundColor(.FQBlue)
			}
		}
		.buttonStyle(FQButtonStyle())
	}
}

struct ActionButton_Previews: PreviewProvider {
    static var previews: some View {
		ActionButton(image: "heart.fill", title: "Fave it")
    }
}
