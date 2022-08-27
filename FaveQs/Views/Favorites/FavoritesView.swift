//
//  FavoritesView.swift
//  FaveQs
//
//  Created by Momeks on 8/27/22.
//

import SwiftUI

struct FavoritesView: View {
	@State private var loginViewPresented = false
	@State private var userViewPresented = false
	
    var body: some View {
		NavigationView {
			ZStack {
				
			}
			.navigationTitle("Favorites")
			.toolbar {
				Button {
					AppDefaults.shared.isUserLogin() ? userViewPresented.toggle() : loginViewPresented.toggle()
				} label: {
					Image(systemName: "person.crop.circle")
				}
			}
		}
		.navigationViewStyle(.stack)
		.sheet(isPresented: $loginViewPresented) {
			LoginView()
		}
		.alert("Hello \(AppDefaults.shared.userName())", isPresented: $userViewPresented, actions: {
			Button("OK", role: .cancel, action: {})
		})
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
