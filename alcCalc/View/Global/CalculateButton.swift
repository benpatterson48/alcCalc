//
//  CalculateButton.swift
//  alcCalc
//
//  Created by Ben Patterson on 8/7/19.
//  Copyright © 2019 Ben Patterson. All rights reserved.
//

import UIKit

class CalculateButton: UIButton {
	override init(frame: CGRect) {
		super.init(frame: frame)
		layer.cornerRadius = 10
		setTitle("CALCULATE", for: .normal)
		setTitleColor(.white, for: .normal)
		titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
		self.backgroundColor = UIColor.Main.blue
		translatesAutoresizingMaskIntoConstraints = false
		heightAnchor.constraint(equalToConstant: 50).isActive = true 
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
