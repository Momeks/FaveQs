//
//  TabImage.swift
//  FaveQs
//
//  Created by Momeks on 8/24/22.
//

import SwiftUI

struct TabBarButton: View {
	
	var image: String
	var color: Color
	var action: (() -> Void)?
	
	var body: some View {
		Button {
			action?()
		} label: {
			Image(systemName: image)
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: 27, height: 27, alignment: .center)
				.foregroundColor(color)
		}
		.buttonStyle(FQButtonStyle())
	}
}

struct TabBarButton_Previews: PreviewProvider {
	static var previews: some View {
		TabBarButton(image: "text.quote", color: .FQBlue)
	}
}

struct FQButtonStyle: ButtonStyle {
	func makeBody(configuration: Configuration) -> some View {
		configuration.label
			.scaleEffect(configuration.isPressed ? 0.9 : 1)
			.animation(.easeOut(duration: 0.2), value: configuration.isPressed)
	}
}
