//
//  ResultLabel.swift
//  alcCalc
//
//  Created by Ben Patterson on 8/13/19.
//  Copyright © 2019 Ben Patterson. All rights reserved.
//

import UIKit

class ResultLabel: UILabel {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		numberOfLines = 0
		textAlignment = .center
		adjustsFontSizeToFitWidth = true
		translatesAutoresizingMaskIntoConstraints = false
		font = UIFont.systemFont(ofSize: 32, weight: .semibold)
		textColor = UIColor.alcBlue
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
