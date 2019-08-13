//
//  MacroResultsView.swift
//  alcCalc
//
//  Created by Ben Patterson on 8/12/19.
//  Copyright © 2019 Ben Patterson. All rights reserved.
//

import UIKit

class MacroResultsView: UIView {
	
	var fatResult = ResultLabel()
	var carbResult = ResultLabel()
	var proteinResult = ResultLabel()
	
	var tdeeResult = ResultLabel()
	var goalResult = ResultLabel()
	var restingResult = ResultLabel()
	
	var fatsTitle = SubHeaderLabel(withText: "Fats (g)")
	var carbsTitle = SubHeaderLabel(withText: "Carbs (g)")
	var proteinTitle = SubHeaderLabel(withText: "Protein (g)")
	
	var tdeeCalsTitle = SubHeaderLabel(withText: "TDEE Cals")
	var goalCalsTitle = SubHeaderLabel(withText: "Goal Cals")
	var restingCalsTitle = SubHeaderLabel(withText: "Resting Cals")
	
	var macrosTitle = TitleWithInfoButton(titleText: "MACROS")
	var caloriesTitle = TitleWithInfoButton(titleText: "CALORIES")
	var disclaimerTitle = TitleWithInfoButton(titleText: "DISCLAIMER")
	
	lazy var tdeeStack = ResultAndTitleStackView(arrangedSubviews: [self.tdeeResult, self.tdeeCalsTitle])
	lazy var goalStack = ResultAndTitleStackView(arrangedSubviews: [self.goalResult, self.goalCalsTitle])
	lazy var restingStack = ResultAndTitleStackView(arrangedSubviews: [self.restingResult, self.restingCalsTitle])
	
	lazy var fatStack = ResultAndTitleStackView(arrangedSubviews: [self.fatResult, self.fatsTitle])
	lazy var carbStack = ResultAndTitleStackView(arrangedSubviews: [self.carbResult, self.carbsTitle])
	lazy var proteinStack = ResultAndTitleStackView(arrangedSubviews: [self.proteinResult, self.proteinTitle])
	
//	let closeButton: UIButton = {
//		let close = UIButton()
//		close.contentMode = .scaleAspectFill
//		close.setImage(UIImage(named: "close"), for: .normal)
//		close.translatesAutoresizingMaskIntoConstraints = false
//		close.widthAnchor.constraint(equalToConstant: 30).isActive = true
//		close.heightAnchor.constraint(equalToConstant: 30).isActive = true
//		return close
//	}()
//
	lazy var caloriesStack: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [self.restingStack, self.tdeeStack, self.goalStack])
		stack.distribution = .fillEqually
		stack.alignment = .fill
		stack.translatesAutoresizingMaskIntoConstraints = false
		return stack
	}()
	
	lazy var macrosStack: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [self.proteinStack, self.carbStack, self.fatStack])
		stack.distribution = .fillEqually
		stack.alignment = .fill
		stack.translatesAutoresizingMaskIntoConstraints = false
		return stack
	}()
	
	var disclaimerLabel: UILabel = {
		let lbl = UILabel()
		lbl.text = """
		There are 4 calories for every gram of carbohydrate/ protein and 9 calories for every gram of fat.
		
		These macros are an estimation, please seek a fitness coach or nutritionist help if you're unsure about your results or do not understand what they mean
		"""
		lbl.textColor = #colorLiteral(red: 1, green: 0.3647058824, blue: 0.3647058824, alpha: 1)
		lbl.numberOfLines = 0
		lbl.textAlignment = .center
		lbl.font = UIFont.italicSystemFont(ofSize: 12)
		lbl.translatesAutoresizingMaskIntoConstraints = false
		return lbl
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = .white
		layer.cornerRadius = 15
		addViews()
	}
	
	func addViews() {
//		addSubview(closeButton)
//		closeButton.topAnchor.constraint(equalTo: topAnchor, constant: 24).isActive = true
//		closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
		
		let contentStack = UIStackView(arrangedSubviews: [caloriesTitle, caloriesStack, macrosTitle, macrosStack, disclaimerTitle, disclaimerLabel])
		addSubview(contentStack)
		contentStack.translatesAutoresizingMaskIntoConstraints = false
		contentStack.axis = .vertical
		contentStack.distribution = .fillProportionally
		contentStack.spacing = 30
		
		contentStack.topAnchor.constraint(equalTo: topAnchor, constant: 32).isActive = true
		contentStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
		contentStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
		contentStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32).isActive = true
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

