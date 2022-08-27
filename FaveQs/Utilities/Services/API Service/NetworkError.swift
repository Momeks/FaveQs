//
//  NetworkError.swift
//  FaveQs
//
//  Created by Momeks on 8/27/22.
//

import Foundation
import Alamofire

enum NetworkError: Error {
	case defaultError(AFError)
	case favqsError(SessionResponseError)
}

extension NetworkError: CustomStringConvertible {
	public var description: String {
		switch self {
		case .defaultError:
			return self.localizedDescription
		case .favqsError(let err):
			return err.message
		}
	}
}
