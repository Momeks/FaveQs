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
	
	func getQuotes(page: Int) {
		isLoading = true
		let params = ["page":"\(page)"]
		Service.shared.request(api: "quotes", parameters: params, completion: { (result: Result<QuoteResponse,AFError>) in
			self.isLoading = false
			switch result {
			case .success(let success):
				self.quotes.append(contentsOf: success.quotes)
			case .failure(let failure):
				self.showAlert = true
				self.alertTitle = "Error \(failure.responseCode?.formatted() ?? "")"
				self.alertMessage = failure.localizedDescription
			}
		})
	}
}
