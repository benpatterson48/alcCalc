//
//  AlcoholContentView.swift
//  alcCalc
//
//  Created by Ben Patterson on 8/7/19.
//  Copyright © 2019 Ben Patterson. All rights reserved.
//

import UIKit

class AlcoholContentView: UIView {
	
	var methodView = UIView()
	
	let calorieView = CalorieMethodView()
	let abvView = ABVMethodView()
	
	let methodTitle = TitleWithInfoButton(titleText: "Conversion Method")
	let methodExplanationTitle = TitleWithInfoButton(titleText: "Method Explanation")
	
	let calculateButton = CalculateButton()
	
	let title: UILabel = {
		let title = UILabel()
		title.text = "Alcohol Conversion"
		title.textColor = UIColor.Main.text
		title.textAlignment = .left
		title.font = UIFont.boldSystemFont(ofSize: 30)
		title.translatesAutoresizingMaskIntoConstraints = false
		return title
	}()
	
	let methodSwitch: UISegmentedControl = {
		let items = ["Calories", "ABV %"]
		let segment = UISegmentedControl(items: items)
		segment.selectedSegmentIndex = 0
		segment.layer.cornerRadius = 10
		segment.backgroundColor = .white
		segment.tintColor = UIColor.Main.blue
		segment.heightAnchor.constraint(equalToConstant: 30).isActive = true
		segment.setTitleTextAttributes([NSAttributedString.Key.strokeColor: UIColor(red: 51, green: 51, blue: 51, alpha: 100)], for: UIControl.State.normal)
		segment.translatesAutoresizingMaskIntoConstraints = false
		return segment
	}()
	
	let methodExplanation: UILabel = {
		let explanation = UILabel()
		explanation.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6)
		explanation.numberOfLines = 0
		explanation.textAlignment = .left 
		explanation.font = UIFont.systemFont(ofSize: 18, weight: .medium)
		explanation.translatesAutoresizingMaskIntoConstraints = false
		explanation.text = "We're using the caloric value of the beverage to convert the consumption into easy to track fat and carb macronutrients."
		explanation.attributedText = explanation.text?.increaseLineSpacing()
		return explanation
	}()
	
	lazy var methodSwitchStack: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [self.methodTitle, self.methodSwitch])
		stack.axis = .vertical
		stack.spacing = 25
		stack.distribution = .fillProportionally
		stack.translatesAutoresizingMaskIntoConstraints = false
		return stack
	}()
	
	lazy var methofExplanationStack: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [self.methodExplanationTitle, self.methodExplanation])
		stack.axis = .vertical
		stack.spacing = 25
		stack.distribution = .fillProportionally
		stack.translatesAutoresizingMaskIntoConstraints = false
		return stack
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addViews()
		abvView.isHidden = true 
	}
	
	func addViews() {
		self.methodView = calorieView
		let stack = UIStackView(arrangedSubviews: [title, self.methodSwitchStack, self.methofExplanationStack, calorieView, abvView, calculateButton])
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.axis = .vertical
		stack.distribution = .fillProportionally
		stack.alignment = .fill
		stack.spacing = 50
		
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
