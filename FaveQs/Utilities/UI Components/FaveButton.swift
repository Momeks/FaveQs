//
//  FaveButton.swift
//  FaveQs
//
//  Created by Momeks on 8/24/22.
//

import SwiftUI

struct FaveButton: View {
	
	var action: (() -> Void)?
	
	var body: some View {
		Button {
			action?()
		} label: {
			RoundedRectangle(cornerRadius: 11)
				.frame(width: 100, height: 40, alignment: .center)
				.foregroundColor(.FQBlue)
				.overlay {
					HStack {
						Image(systemName: "heart.fill")
							.foregroundColor(.white)
						Text("Fave It")
							.foregroundColor(.white)
							.font(.callout.bold())
					}
				}
		}
		.buttonStyle(FQButtonStyle())
	}
}

struct FaveButton_Previews: PreviewProvider {
	static var previews: some View {
		FaveButton()
	}
}
