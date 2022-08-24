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
					TabBarButton(image: "text.quote", color: selection == 0 ? .FQBlue : .gray.opacity(0.5)) {
						selection = 0
					}
					
					TabBarButton(image: "quote.bubble.fill", color: selection == 1 ? .FQBlue : .gray.opacity(0.5)) {
						selection = 1
					}
					
					TabBarButton(image: "heart.fill", color: selection == 2 ? .FQBlue : .gray.opacity(0.5)) {
						selection = 2
					}
					Spacer()
				}
				.background {
					VStack(alignment: .center) {
						Color.clear
							.background(.thickMaterial)
							.frame(width: geo.size.width, height: 70)
					}
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
