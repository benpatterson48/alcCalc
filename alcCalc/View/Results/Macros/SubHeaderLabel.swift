//
//  SubHeaderLabel.swift
//  alcCalc
//
//  Created by Ben Patterson on 8/12/19.
//  Copyright © 2019 Ben Patterson. All rights reserved.
//

import UIKit

class SubHeaderLabel: UILabel {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		textColor = UIColor.lightText
		numberOfLines = 0
		textAlignment = .center
		translatesAutoresizingMaskIntoConstraints = false
		font = UIFont.systemFont(ofSize: 16, weight: .regular)
	}
	
	public convenience init(withText: String) {
		self.init()
		text = withText
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
