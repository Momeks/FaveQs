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
	
	func getQuotes(page: Int) {
		let params = ["page":"\(page)"]
		Service.shared.request(api: "quotes", parameters: params, completion: { (result: Result<QuoteResponse,AFError>) in
			switch result {
			case .success(let success):
				self.quotes = success.quotes
			case .failure(let failure):
				print(failure.localizedDescription)
			}
		})
	}
}
