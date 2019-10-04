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
	
	var macrosTitle = TitleWithInfoButton(titleText: "Macros")
	var caloriesTitle = TitleWithInfoButton(titleText: "Calories")
	var disclaimerTitle = TitleWithInfoButton(titleText: "Disclaimer")
	var macroGoalsTitle = TitleWithInfoButton(titleText: "Current Goal")
	
	lazy var tdeeStack = ResultAndTitleStackView(arrangedSubviews: [self.tdeeResult, self.tdeeCalsTitle])
	lazy var goalStack = ResultAndTitleStackView(arrangedSubviews: [self.goalResult, self.goalCalsTitle])
	lazy var restingStack = ResultAndTitleStackView(arrangedSubviews: [self.restingResult, self.restingCalsTitle])
	
	lazy var fatStack = ResultAndTitleStackView(arrangedSubviews: [self.fatResult, self.fatsTitle])
	lazy var carbStack = ResultAndTitleStackView(arrangedSubviews: [self.carbResult, self.carbsTitle])
	lazy var proteinStack = ResultAndTitleStackView(arrangedSubviews: [self.proteinResult, self.proteinTitle])
	
	let closeButton: UIButton = {
		let close = UIButton()
		close.contentMode = .scaleAspectFill
		close.setImage(UIImage(named: "close"), for: .normal)
		close.translatesAutoresizingMaskIntoConstraints = false
		close.widthAnchor.constraint(equalToConstant: 25).isActive = true
		close.heightAnchor.constraint(equalToConstant: 25).isActive = true
		return close
	}()
	
	let macroGoals: UISegmentedControl = {
		let items = ["Deficit", "Maintenance", "Surplus"]
		let segment = UISegmentedControl(items: items)
		segment.selectedSegmentIndex = 0
		segment.layer.cornerRadius = 10
		segment.tintColor = UIColor.Main.blue
		segment.heightAnchor.constraint(equalToConstant: 30).isActive = true
		segment.setTitleTextAttributes([NSAttributedString.Key.strokeColor: UIColor(red: 51, green: 51, blue: 51, alpha: 100)], for: UIControl.State.normal)
		segment.translatesAutoresizingMaskIntoConstraints = false
		return segment
	}()

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
		lbl.text = "Protein can be adjusted to 1g per pound of body weight if you're in a surplus/ maintenance, adjust fats/ carbs."
		lbl.numberOfLines = 0
		lbl.textAlignment = .center
		lbl.font = UIFont.italicSystemFont(ofSize: 12)
		lbl.translatesAutoresizingMaskIntoConstraints = false
		return lbl
	}()
	
	var ctaButton: UIButton = {
		let button = UIButton()
		button.titleLabel?.textAlignment = .center
		button.titleLabel?.adjustsFontSizeToFitWidth = true
		button.setTitle("FULL EXAMPLE HERE", for: .normal)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	let titleLabel: UILabel = {
		let title = UILabel()
		title.text = "Results"
		title.textColor = UIColor.darkText
		title.textAlignment = .left
		title.font = UIFont.boldSystemFont(ofSize: 30)
		title.translatesAutoresizingMaskIntoConstraints = false
		return title
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)
		if #available(iOS 13, *) {
			layer.cornerRadius = 10
			backgroundColor = .systemBackground
			disclaimerLabel.textColor = .systemRed
			ctaButton.setTitleColor(.systemBlue, for: .normal)
		} else {
			layer.cornerRadius = 15
			backgroundColor = .white
			disclaimerLabel.textColor = .red
			ctaButton.setTitleColor(.blue, for: .normal)
		}
		addViews()
		
		macrosTitle.title.font = UIFont.systemFont(ofSize: 16, weight: .medium)
		caloriesTitle.title.font = UIFont.systemFont(ofSize: 16, weight: .medium)
		disclaimerTitle.title.font = UIFont.systemFont(ofSize: 16, weight: .medium)
	}
	
	func addViews() {
		addSubview(titleLabel)
		titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 32).isActive = true
		titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
		
		addSubview(closeButton)
		closeButton.topAnchor.constraint(equalTo: titleLabel.topAnchor).isActive = true
		closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
		
		let contentStack = UIStackView(arrangedSubviews: [macrosTitle, macroGoals, caloriesTitle, caloriesStack, macrosTitle, macrosStack, disclaimerTitle, disclaimerLabel, ctaButton])
		addSubview(contentStack)
		contentStack.translatesAutoresizingMaskIntoConstraints = false
		contentStack.axis = .vertical
		contentStack.distribution = .fillProportionally
		if UIDevice.current.modelName == "iPhone SE" || UIDevice.current.modelName == "iPhone 5" || UIDevice.current.modelName == "iPhone 5s" {
			contentStack.spacing = 10
		} else {
			contentStack.spacing = 20
		}
		disclaimerLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
		contentStack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24).isActive = true
		contentStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
		contentStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
		contentStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40).isActive = true
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

