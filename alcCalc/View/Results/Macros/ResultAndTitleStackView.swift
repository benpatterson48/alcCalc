//
//  ResultAndTitleStackView.swift
//  alcCalc
//
//  Created by Ben Patterson on 8/13/19.
//  Copyright © 2019 Ben Patterson. All rights reserved.
//

import UIKit

class ResultAndTitleStackView: UIStackView {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		spacing = 10
		axis = .vertical
		distribution = .fillProportionally
		translatesAutoresizingMaskIntoConstraints = false
	}
	
	required init(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
