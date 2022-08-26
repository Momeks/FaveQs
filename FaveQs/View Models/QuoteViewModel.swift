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
		
		var parameters = ["page":"\(page)", "type":type ?? .none] as [String : Any]
		if let filter = filter {
			parameters["filter"] = filter
		}
		
		Service.shared.request(api: "quotes", parameters: parameters, completion: { (result: Result<QuoteResponse,AFError>) in
			self.isLoading = false
			switch result {
			case .success(let success):
				if refreshable == true { self.quotes.removeAll() }
				self.quotes.append(contentsOf: success.quotes)
			case .failure(let failure):
				self.showAlert = true
				self.alertTitle = "Error \(failure.responseCode?.formatted() ?? "")"
				self.alertMessage = failure.localizedDescription
			}
		})
	}
}
