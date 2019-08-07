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
	var radioImage: String
	var text: String
	
	init(title: String, radioImage: String, text: String) {
		self.title = title
		self.radioImage = radioImage
		self.text = text
	}
}
