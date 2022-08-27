//
//  User.swift
//  FaveQs
//
//  Created by Momeks on 8/27/22.
//

import Foundation

// MARK: - SessionResponse
struct SessionResponse: Codable {
	let userToken, login, email: String

	enum CodingKeys: String, CodingKey {
		case userToken = "User-Token"
		case login, email
	}
}

// MARK: - User
struct User: Codable {
	let login, password: String
}

// MARK: - SessionResponseError
struct SessionResponseError: Codable {
	let errorCode: Int
	let message: String

	enum CodingKeys: String, CodingKey {
		case errorCode = "error_code"
		case message
	}
}
