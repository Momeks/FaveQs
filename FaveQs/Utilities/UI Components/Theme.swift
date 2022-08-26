//
//  Theme.swift
//
//  Created by Momeks on 10/2/21.
//

import UIKit

class Theme {
	
	static func navigationBarColors(
		background : UIColor?,
		titleColor : UIColor? = nil,
		tintColor : UIColor? = UIColor(named: "AccentColor"),
		fontInLine: String,
		fontLarge: String
	){
		let navigationAppearance = UINavigationBarAppearance()
		navigationAppearance.configureWithOpaqueBackground()
		navigationAppearance.backgroundColor = background
		
		navigationAppearance.shadowColor = .clear
		
		navigationAppearance.titleTextAttributes = [
			.foregroundColor: titleColor ?? .label,
			.font : UIFont(name: fontInLine, size: 20)!
		]
		
		navigationAppearance.largeTitleTextAttributes = [
			.foregroundColor: titleColor ?? .label,
			.font : UIFont(name: fontLarge, size: 32)!
		]
		
		UINavigationBar.appearance().standardAppearance = navigationAppearance
		UINavigationBar.appearance().compactAppearance = navigationAppearance
		UINavigationBar.appearance().scrollEdgeAppearance = navigationAppearance
		
		UINavigationBar.appearance().tintColor = tintColor ?? titleColor ?? .black
		UINavigationBar.appearance().barTintColor = tintColor ?? titleColor ?? .black
	}
}


