//
//  CalorieMethodView.swift
//  alcCalc
//
//  Created by Ben Patterson on 8/8/19.
//  Copyright © 2019 Ben Patterson. All rights reserved.
//

import UIKit

class CalorieMethodView: UIView {
	
	let calorieMethodTitle = TitleWithInfoButton(titleText: "Enter beverage calories:")
	let calorieInputView = CustomTextFieldView(font: UIFont.systemFont(ofSize: 80, weight: .medium), placeholder: "cals")
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addViews()
		backgroundColor = UIColor.alcWhite
	}
	
	func addViews() {
		let calorieStack = UIStackView(arrangedSubviews: [calorieMethodTitle, calorieInputView])
		calorieStack.translatesAutoresizingMaskIntoConstraints = false
		calorieStack.axis = .vertical
		calorieStack.spacing = 50
		calorieStack.distribution = .fillProportionally
		calorieStack.alignment = .fill
		
		addSubview(calorieStack)
		calorieStack.topAnchor.constraint(equalTo: topAnchor).isActive = true
		calorieStack.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
		calorieStack.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
		calorieStack.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
