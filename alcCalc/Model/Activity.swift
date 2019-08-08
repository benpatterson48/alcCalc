//
//  Activity.swift
//  alcCalc
//
//  Created by Ben Patterson on 8/7/19.
//  Copyright © 2019 Ben Patterson. All rights reserved.
//

import Foundation

struct Activity {
	var title: String
	var text: String
	var multiplier: Double
	
	init(title: String, text: String, multiplier: Double) {
		self.title = title
		self.text = text
		self.multiplier = multiplier
	}
}
