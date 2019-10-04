//
//  PopupTextStyles.swift
//  alcCalc
//
//  Created by Ben Patterson on 8/15/19.
//  Copyright © 2019 Ben Patterson. All rights reserved.
//

import UIKit

class TitleTextLabel: UILabel {
	override init(frame: CGRect) {
		super.init(frame: frame)
		numberOfLines = 0
		textAlignment = .left
		textColor = UIColor.darkText
		font = UIFont.boldSystemFont(ofSize: 22)
		translatesAutoresizingMaskIntoConstraints = false
	}
	public convenience init(ofText: String) {
		self.init()
		text = ofText
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

class SubTitleTextLabel: UILabel {
	override init(frame: CGRect) {
		super.init(frame: frame)
		textColor = UIColor.lightText
		numberOfLines = 0
		textAlignment = .left
		font = UIFont.systemFont(ofSize: 16, weight: .semibold)
		translatesAutoresizingMaskIntoConstraints = false
	}
	public convenience init(ofText: String) {
		self.init()
		text = ofText
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

class RegularTextLabel: UILabel {
	override init(frame: CGRect) {
		super.init(frame: frame)
		textColor = UIColor.lightText
		numberOfLines = 0
		textAlignment = .left
		font = UIFont.systemFont(ofSize: 14, weight: .regular)
		translatesAutoresizingMaskIntoConstraints = false
	}
	public convenience init(ofText: String) {
		self.init()
		text = ofText
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
