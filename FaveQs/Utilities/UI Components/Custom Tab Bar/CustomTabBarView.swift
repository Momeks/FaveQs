//
//  CustomTabBarView.swift
//  FaveQs
//
//  Created by Momeks on 8/24/22.
//

import SwiftUI

struct CustomTabBarView: View {
	
	@Binding var selection: Int
	
	var body: some View {
		GeometryReader { geo in
			VStack(alignment: .center) {
				Spacer()
				HStack(spacing: 35) {
					Spacer()
					TabBarButton(image: "text.quote", color: selection == 0 ? .FQBlue : .lightGray) {
						selection = 0
					}
					TabBarButton(image: "quote.bubble.fill", color: selection == 1 ? .FQBlue : .lightGray) {
						selection = 1
					}
					TabBarButton(image: "heart.fill", color: selection == 2 ? .FQBlue : .lightGray) {
						selection = 2
					}
					Spacer()
				}
			}
		}
	}
}

struct CustomTabBarView_Previews: PreviewProvider {
	static var previews: some View {
		CustomTabBarView(selection: .constant(0))
	}
}
