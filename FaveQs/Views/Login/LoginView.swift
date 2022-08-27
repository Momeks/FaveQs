//
//  LoginView.swift
//  FaveQs
//
//  Created by Momeks on 8/23/22.
//

import SwiftUI

struct LoginView: View {
	
	@ObservedObject private var viewModel = SessionViewModel()
	@FocusState private var passwordFocused: Bool
	@State private var username = "momekssss"
	@State private var password = "123456789"
	@State private var showAlert = false
	@State private var message = ""
	@State private var title = ""
	
	var body: some View {
		ZStack {
			HUDView()
				.opacity(viewModel.isLoading ? 1.0 : 0.0)
			
			VStack() {
				//Logo
				HStack {
					Image("Icon")
					Image("Logo")
				}
				
				//User/pass entry
				VStack {
					TextField("Username or Email", text: $username)
						.onSubmit {
							passwordFocused = true
						}
					
					Divider()
					
					SecureField("Password", text: $password)
						.focused($passwordFocused)
						.onSubmit {
							createSession()
						}
				}
				.padding(50)
			}
		}
		
		.alert("Error", isPresented: $showAlert) {
			Button("Dismiss", role: .cancel, action: {})
		} message: {
			Text("Please fill in all the required fields")
		}
		
		.alert(viewModel.alertTitle, isPresented: $viewModel.showAlert) {
			Button("Dismiss", role: .cancel, action: {})
		} message: {
			Text(viewModel.alertMessage)
		}
	}
	
	func createSession() {
		if username.isEmpty || password.isEmpty {
			showAlert = true
		} else {
			let user = User(login: username, password: password)
			viewModel.createSession(user: user)
		}
	}
}


struct LoginView_Previews: PreviewProvider {
	static var previews: some View {
		LoginView()
	}
}
