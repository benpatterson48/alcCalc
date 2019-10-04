//
//  ABVMethodView.swift
//  alcCalc
//
//  Created by Ben Patterson on 8/8/19.
//  Copyright © 2019 Ben Patterson. All rights reserved.
//

import UIKit

class ABVMethodView: UIView {
	
	let abvMethodTitle = TitleWithInfoButton(titleText: "Enter beverage ounces and percent")
	let ouncesInputView = CustomTextFieldView(font: UIFont.systemFont(ofSize: 65, weight: .medium), placeholder: "oz")
	let abvPercentInputView = CustomTextFieldView(font: UIFont.systemFont(ofSize: 65, weight: .medium), placeholder: "%")
	
	lazy var abvInputStack: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [self.ouncesInputView, self.abvPercentInputView])
		stack.axis = .horizontal
		stack.spacing = 30
		stack.distribution = .fillEqually
		stack.translatesAutoresizingMaskIntoConstraints = false
		return stack
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addViews()
		backgroundColor = UIColor.alcWhite
		abvMethodTitle.title.numberOfLines = 0
	}
	
	func addViews() {

		let abvStack = UIStackView(arrangedSubviews: [abvMethodTitle, abvInputStack])
		abvStack.translatesAutoresizingMaskIntoConstraints = false
		abvStack.axis = .vertical
		abvStack.spacing = 50
		abvStack.distribution = .fillProportionally
		abvStack.alignment = .fill
		
		addSubview(abvStack)
		abvStack.topAnchor.constraint(equalTo: topAnchor).isActive = true
		abvStack.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
		abvStack.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
		abvStack.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
