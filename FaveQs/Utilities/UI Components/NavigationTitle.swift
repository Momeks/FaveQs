//
//  NavigationTitle.swift
//  FaveQs
//
//  Created by Momeks on 8/24/22.
//

import SwiftUI

struct NavigationTitle: View {
	var text: String
    var body: some View {
        Text(text)
			.font(.system(size: 30, weight: .bold, design: .serif))
			.frame(maxWidth: .infinity, maxHeight: 40, alignment: .leading)
			.padding(30)
    }
}

struct NavigationTitle_Previews: PreviewProvider {
    static var previews: some View {
		NavigationTitle(text: "Random Quote")
    }
}
