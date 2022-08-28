//
//  User.swift
//  FaveQs
//
//  Created by Momeks on 8/27/22.
//

import Foundation

// MARK: - SessionResponse
struct SessionResponse: Codable {
	let userToken, login, email, message: String?
	let errorCode: Int?

	enum CodingKeys: String, CodingKey {
		case userToken = "User-Token"
		case login, email
		
		//Handle errors
		case errorCode = "error_code"
		case message
	}
}
