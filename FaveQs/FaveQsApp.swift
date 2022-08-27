//
//  FaveQsApp.swift
//  FaveQs
//
//  Created by Momeks on 8/23/22.
//

import SwiftUI

@main
struct FaveQsApp: App {
	
	@State private var selection: Int = 2
	var body: some Scene {
		WindowGroup {
			TabView(selection: $selection) {
				RandomQuoteView()
					.tag(0)
				
				QuoteListView()
					.tag(1)
				
				FavoritesView()
					.tag(2)
			}
			.overlay {
				CustomTabBarView(selection: $selection)
					.ignoresSafeArea(.keyboard, edges: .bottom)
			}
			.onAppear {
				Theme.navigationBarColors(background: .systemBackground, tintColor: .FQBlue, fontInLine: "Georgia-Bold", fontLarge: "Georgia-Bold")
			}
		}
	}
}

