//
//  HorizontalStack.swift
//  alcCalc
//
//  Created by Ben Patterson on 8/13/19.
//  Copyright © 2019 Ben Patterson. All rights reserved.
//

import UIKit

class HorizontalStack: UIStackView {
	override init(frame: CGRect) {
		super.init(frame: frame)
		spacing = 40
		axis = .horizontal
		alignment = .fill
		distribution = .fillEqually
		translatesAutoresizingMaskIntoConstraints = false
	}
	
	required init(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
