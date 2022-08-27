//
//  DataController.swift
//  FaveQs
//
//  Created by Momeks on 8/27/22.
//

import Foundation
import CoreData

class DataController: ObservableObject {
	let container = NSPersistentContainer(name: "Database")
	
	init() {
		container.loadPersistentStores { description, error in
			if let error = error {
				print("Core data failed to laod: \(error.localizedDescription)")
			}
		}
	}
}
