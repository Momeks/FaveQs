//
//  Service.swift
//  FaveQs
//
//  Created by Momeks on 8/25/22.
//

import Foundation
import Alamofire

protocol ServiceProtocol {
	func request<T:Codable>(api: String, method: HTTPMethod, parameters:[String:Any], encoding: ParameterEncoding, completion: @escaping(Result<T, AFError>) -> Void)
}

class Service {
	
	static let shared: ServiceProtocol = Service()
	private let baseURL = "https://favqs.com/api/"
	
	private let headers: HTTPHeaders = [
		"Content-Type": "application/json",
		"Authorization": "Token token=7fb9c2a907716d181276d58d6d3278cd"
	]
	
	private let jsonDecoder: JSONDecoder = {
		let jsonDecoder = JSONDecoder()
		jsonDecoder.dateDecodingStrategy = .iso8601
		return jsonDecoder
	}()
}

extension Service: ServiceProtocol {
	func request<T:Codable>(api: String, method: HTTPMethod, parameters:[String:Any], encoding:  ParameterEncoding, completion: @escaping(Result<T, AFError>) -> Void) {
		let url = URL(string: baseURL + api)!
		print(url)
		let parameters = parameters
		AF.request(url, method: method , parameters: parameters, encoding: encoding, headers: headers)
			.validate(statusCode: 200..<300)
			.responseDecodable(of: T.self, decoder: jsonDecoder) { response in
				completion(response.result)
			}
	}
}
