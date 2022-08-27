//
//  UserDefaults.swift
//  FaveQs
//
//  Created by Momeks on 8/27/22.
//

import Foundation

class AppDefaults {
	
	static let shared = AppDefaults()
	
	init() {
		UserDefaults.standard.register(defaults: ["isLogin" : false])
	}
	
	func isUser(loggedIn: Bool)  {
		UserDefaults.standard.set(loggedIn, forKey: "isLogin")
	}
	
	func isUserLogin() -> Bool {
		UserDefaults.standard.bool(forKey: "isLogin")
	}

	func getUserName(_ name: String) {
		UserDefaults.standard.set(name, forKey: "username")
	}
	
	func userName() -> String {
		return UserDefaults.standard.string(forKey: "username")?.capitalized ?? ""
	}
}
