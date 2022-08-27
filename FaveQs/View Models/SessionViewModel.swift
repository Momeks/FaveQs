//
//  SessionViewModel.swift
//  FaveQs
//
//  Created by Momeks on 8/27/22.
//

import Foundation
import Alamofire

class SessionViewModel: ObservableObject {
	
	@Published var isLoading = false
	@Published var showAlert = false
	@Published var alertMessage = ""
	@Published var alertTitle = ""
	
	func createSession(user: User) {
		isLoading = true
		let jsonBody = "{\n  \"user\": {\n    \"login\": \"\(user.login)\",\n    \"password\": \"\(user.password)\"\n  }\n}"
		let parameter = convertToDictionary(json: jsonBody) ?? [:]
		APIService.shared.request(api: "session", method: .post, parameters: parameter , encoding: JSONEncoding.default, completion: { [self] (result: Result<SessionResponse,AFError>) in
			self.isLoading = false
			switch result {
			case .success(let success):
				if let errorCode = success.errorCode {
					self.showAlert = true
					self.alertTitle = "Error code \(errorCode)"
					self.alertMessage = success.message ?? ""
				} else {
					if success.userToken != nil {
						AppDefaults.shared.isUser(loggedIn: true)
						AppDefaults.shared.getUserName(success.login ?? "N/A")
						self.showAlert = true
						self.alertTitle = "Welcome!"
						self.alertMessage = "You are successfuly logged in as \(success.login ?? "N/A")"
					}
				}
			case .failure(let failure):
				self.showAlert = true
				self.alertTitle = "Error \(failure.responseCode?.formatted() ?? "")"
				self.alertMessage = failure.localizedDescription
			}
		})
	}
}

//MARK: - Convert JSON to dictionary
func convertToDictionary(json: String) -> [String:Any]? {
	if let data = json.data(using: .utf8) {
		do {
			let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any]
			return json
		} catch {
			print("Something went wrong")
		}
	}
	return nil
}

