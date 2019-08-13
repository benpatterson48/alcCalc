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
		textColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
		numberOfLines = 0
		textAlignment = .center
		adjustsFontSizeToFitWidth = true
		translatesAutoresizingMaskIntoConstraints = false
		font = UIFont.systemFont(ofSize: 32, weight: .semibold)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
