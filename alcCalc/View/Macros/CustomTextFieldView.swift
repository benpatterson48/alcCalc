//
//  CustomTextField.swift
//  alcCalc
//
//  Created by Ben Patterson on 8/6/19.
//  Copyright © 2019 Ben Patterson. All rights reserved.
//

import UIKit

class CustomTextFieldView: UIView {
	
	let textField: UITextField = {
		let textField = UITextField()
		textField.borderStyle = .none
		textField.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
		textField.textAlignment = .center
		textField.translatesAutoresizingMaskIntoConstraints = false
		return textField
	}()
	
	let underline: UIView = {
		let view = UIView()
		view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.heightAnchor.constraint(equalToConstant: 2).isActive = true
		return view
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
	}
	
	public convenience init(font: UIFont, placeholder: String) {
		self.init()
		textField.font = font
		textField.placeholder = placeholder
		
		addViews()
	}
	
	func addViews() {
		let stack = UIStackView(arrangedSubviews: [textField, underline])
		stack.spacing = 10
		stack.axis = .vertical
		stack.distribution = .fillProportionally
		stack.translatesAutoresizingMaskIntoConstraints = false
		
		addSubview(stack)
		stack.topAnchor.constraint(equalTo: topAnchor).isActive = true
		stack.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
		stack.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
		stack.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
