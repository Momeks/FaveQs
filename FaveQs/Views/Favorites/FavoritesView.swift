//
//  FavoritesView.swift
//  FaveQs
//
//  Created by Momeks on 8/27/22.
//

import SwiftUI

struct FavoritesView: View {
    var body: some View {
		NavigationView {
			ZStack {
				
			}
			.navigationTitle("Favorites")
			.toolbar {
				Button {
					
				} label: {
					Image(systemName: "person.crop.circle")
				}
			}
		}
		.navigationViewStyle(.stack)
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
