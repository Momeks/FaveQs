//
//  Service.swift
//  FaveQs
//
//  Created by Momeks on 8/25/22.
//

import Foundation
import Alamofire

protocol ServiceProtocol {
	func request<T:Codable>(api: String, parameters:[String:Any], completion: @escaping(Result<T, AFError>) -> Void)
}

class Service {
	static let shared: ServiceProtocol = Service()
	
	private let jsonDecoder: JSONDecoder = {
		let jsonDecoder = JSONDecoder()
		jsonDecoder.dateDecodingStrategy = .iso8601
		return jsonDecoder
	}()
	private let baseURL = "https://favqs.com/api/"
	private let APIKey = "7fb9c2a907716d181276d58d6d3278cd"
	private let headers: HTTPHeaders = [
		"Authorization": "Token token=7fb9c2a907716d181276d58d6d3278cd",
		"Content-Type": "application/json"
	]
	
	init() { }
}

extension Service: ServiceProtocol {
	func request<T:Codable>(api: String, parameters:[String:Any], completion: @escaping(Result<T, AFError>) -> Void) {
		let url = URL(string: baseURL + api)!
		print(url.description)
		let parameters = parameters
		AF.request(url, method: .get , parameters: parameters, headers: headers)
			.validate(statusCode: 200..<300)
			.responseDecodable(of: T.self, decoder: jsonDecoder) { response in
				completion(response.result)
			}
	}
}
