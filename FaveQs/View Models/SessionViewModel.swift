//
//  SessionViewModel.swift
//  FaveQs
//
//  Created by Momeks on 8/27/22.
//

import Foundation
import Alamofire

class SessionViewModel: ObservableObject {
	
	@Published var user = [User]()
	@Published var isLoading = false
	@Published var showAlert = false
	@Published var alertMessage = ""
	@Published var alertTitle = ""
	
	func createSession(user: User) {
		isLoading = true
		let jsonBody = "{\n  \"user\": {\n    \"login\": \"\(user.login)\",\n    \"password\": \"\(user.password)\"\n  }\n}"
		let parameter = convertToDictionary(json: jsonBody) ?? [:]
		Service.shared.request(api: "session", method: .post, parameters: parameter , encoding: JSONEncoding.default, completion: { (result: Result<SessionResponse,AFError>) in
			self.isLoading = false
			switch result {
			case .success(let success):
				print(success)
			case .failure(let failure):
				print(failure)
			}
		})
	}
}




class MyRequestController {
	
	static let shared = MyRequestController()
	
	func sendRequest() {
		/* Configure session, choose between:
		 * defaultSessionConfiguration
		 * ephemeralSessionConfiguration
		 * backgroundSessionConfigurationWithIdentifier:
		 And set session-wide properties, such as: HTTPAdditionalHeaders,
		 HTTPCookieAcceptPolicy, requestCachePolicy or timeoutIntervalForRequest.
		 */
		let sessionConfig = URLSessionConfiguration.default
		
		/* Create session, and optionally set a URLSessionDelegate. */
		let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
		
		/* Create the Request:
		 Session (POST https://favqs.com/api/session)
		 */
		
		guard let url = URL(string: "https://favqs.com/api/session") else {return}
		var request = URLRequest(url: url)
		request.httpMethod = "POST"
		
		// Headers
		
		request.addValue("application/json", forHTTPHeaderField: "Content-Type")
		request.addValue("Token token=7fb9c2a907716d181276d58d6d3278cd", forHTTPHeaderField: "Authorization")
		request.addValue("_favqs_session=DE7jPhl3gTca1pCFWN%2BaFZYmhP0%2FsTzjrdYMweqNCKhDw5iOtgqLfeW09KTIupbbwQ2mbC4eR9e7GQc%2B5FmvHDgp6dgAmCGpoiScQa5L0FmWl%2BgY9MItQgx%2BwF1C0SWCgzSSk3n1FEvxlSrG3RMlHY31vSCPyHrq%2Fq%2Fv2eQnOka1DVv5Nf%2BF6DM%3D--baAgrfyGygX%2BzARg--bduCDQDcTZVU4emzSEuUug%3D%3D", forHTTPHeaderField: "Cookie")
		
		// JSON Body
		
//		let bodyObject: [String : Any] = [
//			"user": [
//				"login": "momeks",
//				"password": "123456789"
//			]
//		]
//		request.httpBody = try! JSONSerialization.data(withJSONObject: bodyObject, options: [])
		
		let jsonBody = """
{
  "user": {
 "login": "momeks",
 "password": "123456789"
  }
}
"""
		request.httpBody = jsonBody.data(using: .utf8)
		/* Start a new Task */
		let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
			if (error == nil) {
				// Success
				let statusCode = (response as! HTTPURLResponse).statusCode
				print("URL Session Task Succeeded: HTTP \(statusCode)")
			}
			else {
				// Failure
				print("URL Session Task Failed: %@", error!.localizedDescription);
			}
		})
		task.resume()
		session.finishTasksAndInvalidate()
	}
}


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



