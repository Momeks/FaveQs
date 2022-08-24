//
//  FaveQsApp.swift
//  FaveQs
//
//  Created by Momeks on 8/23/22.
//

import SwiftUI

@main
struct FaveQsApp: App {
	
	@State var selection: Int = 0
	
	var body: some Scene {
		WindowGroup {
			TabView(selection: $selection) {
				RandomQuoteView()
					.tag(0)
				
				LoginView()
					.tag(1)
				
				RandomQuoteView()
					.tag(2)
			}
			.overlay {
				CustomTabBarView(selection: $selection)
			}
		}
	}
}

