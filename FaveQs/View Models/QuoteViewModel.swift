//
//  QuoteViewModel.swift
//  FaveQs
//
//  Created by Momeks on 8/25/22.
//

import Foundation
import Alamofire

class QuoteViewModel: ObservableObject {
	
	@Published var quotes = [Quote]()
	@Published var isLoading = true
	@Published var showAlert = false
	@Published var alertMessage = ""
	@Published var alertTitle = ""
	
	enum FQType: String, CaseIterable {
		case user
		case tag
		case author
		case none = ""
	}
	
	func getQuotes(page: Int, filter: String? = nil, type: FQType? = nil, refreshable: Bool? = nil) {
		isLoading = true
		
		var body = ["page":"\(page)", "type":type ?? .none] as [String : Any]
		if let filter = filter {
			body["filter"] = filter
		}
		
		APIService.shared.request(api: "quotes", method: .get, parameters: body, encoding: URLEncoding.default, completion: { (result: Result<QuoteResponse,AFError>) in
			self.isLoading = false
			switch result {
			case .success(let success):
				if !success.lastPage {
					if refreshable == true { self.quotes.removeAll() }
					self.quotes.append(contentsOf: success.quotes)
				} else {
					self.showAlert = true
					self.alertTitle = "Alas!"
					self.alertMessage = "No more quote left to show"
				}
			case .failure(let failure):
				self.showAlert = true
				self.alertTitle = "Error \(failure.responseCode?.formatted() ?? "")"
				self.alertMessage = failure.localizedDescription
			}
		})
	}
}
