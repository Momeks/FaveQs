//
//  HUDView.swift
//  World of Dinosaurs
//
//  Created by Momeks on 8/9/22.
//  Copyright © 2022 WORLD OF DINOSAURS. All rights reserved.
//

import SwiftUI

struct HUDView: View {
	var body: some View {
		RoundedRectangle(cornerRadius: 10)
			.frame(width: 40, height: 40)
			.foregroundColor(Color(uiColor: .systemGray5))
			.overlay {
				ProgressView()
					.progressViewStyle(.circular)
			}
	}
}

struct HUDView_Previews: PreviewProvider {
	static var previews: some View {
		HUDView()
	}
}
