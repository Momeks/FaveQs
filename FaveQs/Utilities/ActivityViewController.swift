//
//  ActivityViewController.swift
//  FaveQs
//
//  Created by Momeks on 8/27/22.
//

import UIKit
import SwiftUI

struct ActivityViewController: UIViewControllerRepresentable {
	@Binding var activityItems: [Any]
	var applicationActivities: [UIActivity]? = nil
	@Environment(\.presentationMode) var presentationMode
	
	func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityViewController>) -> UIActivityViewController {
		print("ActivityViewController.makeUIViewController() - activityItems=\(activityItems)")
		let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
		return controller
	}
	
	func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ActivityViewController>) {}
}
