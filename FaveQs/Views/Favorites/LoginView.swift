//
//  LoginView.swift
//  FaveQs
//
//  Created by Momeks on 8/23/22.
//

import SwiftUI

struct LoginView: View {
	private enum Field: Int, Hashable {
		case username, password
	}
	@FocusState private var focusedField: Field?
	@Environment(\.presentationMode) var presentationMode
	@ObservedObject private var viewModel = SessionViewModel()
	@State private var username = ""
	@State private var password = ""
	@State private var showAlert = false
	@State private var message = ""
	@State private var title = ""
	
	var body: some View {
		NavigationView {
			ZStack {
				HUDView()
					.opacity(viewModel.isLoading ? 1.0 : 0.0)
				
				VStack() {
					Spacer()
					//Logo
					HStack {
						Image("Icon")
						Image("Logo")
					}
					
					//User/pass entries
					VStack {
						TextField("Username or Email", text: $username)
							.focused($focusedField, equals: .username)
							.onSubmit {
								focusedField = .password
							}
						
						Divider()
						
						SecureField("Password", text: $password)
							.focused($focusedField, equals: .password)
							.onSubmit {
								createSession()
							}
					}
					.padding(50)
					Spacer()
				}
			}
			.ignoresSafeArea(edges: [.top])
			.toolbar {
				Button {
					presentationMode.wrappedValue.dismiss()
				} label: {
					Image(systemName: "xmark")
				}
			}
		}
		
		.onAppear {
			DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
				focusedField = .username
			}
		}
		
		.alert("Error", isPresented: $showAlert) {
			Button("Dismiss", role: .cancel, action: {})
		} message: {
			Text("Please fill in all the required fields")
		}
		
		.alert(viewModel.alertTitle, isPresented: $viewModel.showAlert) {
			Button("Dismiss", role: .cancel, action: {
				if AppDefaults.shared.isUserLogin() {
					presentationMode.wrappedValue.dismiss()
				}
			})
		} message: {
			Text(viewModel.alertMessage)
		}
	}
}

extension LoginView {
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
