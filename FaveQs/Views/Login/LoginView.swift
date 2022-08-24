//
//  LoginView.swift
//  FaveQs
//
//  Created by Momeks on 8/23/22.
//

import SwiftUI

struct LoginView: View {
	
	@State private var username = ""
	@State private var password = ""
	
	var body: some View {
		
		VStack() {
			//Logo
			HStack {
				Image("Icon")
				Image("Logo")
			}
			
			//User/pass entry
			VStack {
				TextField("Username or Email", text: $username)
				Divider()
				SecureField("Password", text: $password)
			}
			.padding(50)
		}
	}
}

struct LoginView_Previews: PreviewProvider {
	static var previews: some View {
		LoginView()
	}
}
