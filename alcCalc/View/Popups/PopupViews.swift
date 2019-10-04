//
//  PopupViews.swift
//  alcCalc
//
//  Created by Ben Patterson on 8/15/19.
//  Copyright © 2019 Ben Patterson. All rights reserved.
//

import UIKit

class MacroPopupView: UIView {
	var mainTitle = TitleTextLabel(ofText: "Macro Calculations Explained")
	
	var equationSubTitle = SubTitleTextLabel(ofText: "Equation Explained")
	var equationText = RegularTextLabel(ofText: """
Equation for Men's Resting Calories:
(10 * Weight) + (6.25 * Height) - (5 * Age) + 5

Equation for Women's Resting Calories:
(10 * Weight) + (6.25 * Height) - (5 * Age) - 161

Equation for Finding Protein:
If you're in a deficit: Weight * 1g
If you're not in a deifict: Weight * 0.82g

Equation for Finding Fats:
Calories from Fat = Goal Calories * 0.3
Fat Macros = Fat Calories / 9

Equation for Finding Carbs:
Carbs = (Goal Cals - Protein Cals + Fat Cals) / 4

There are 4 calories for every gram of carbohydrate/ protein and 9 calories for every gram of fat.
"""
)
	
	var definitionsTitle = SubTitleTextLabel(ofText: "Definitions Explained")
	var definitionsText = RegularTextLabel(ofText: """
Resting Calories - The amount of calories you burn by just being alive based on your weight, height, age, and gender.

TDEE Calories - The amount of calories you burn in a day with your current activity level, we use the following equation:

TDEE Calories = Resting Calories * Activity Indicator

Activity Indicators:
Sedentary: 1.2, Moderately Active: 1.4, Above Average: 1.6, Very Active: 1.8, Competitive Active: 2.0

Your activity indicator is based on how active you are on a consistent daily basis.

Goal Calories - The amount of calories you're intaking based on your current goals which can be a surplus, maintenance, or cut.

If you're cutting then you will cut 0.5% of your body weight per week.

The equation we use for this is:
Weight * 0.005 (Net Weight Loss per Week) * 3500 / 7 (The daily caloric calorie deficit)

If you're in a surplus you will start with an increase of 400 calories, once you try this for a week or two you can change depending on your desired gaining rate.
"""
)
	
	lazy var equationStack: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [self.equationSubTitle, self.equationText])
		stack.axis = .vertical
		stack.spacing = 10
		stack.distribution = .fillProportionally
		stack.translatesAutoresizingMaskIntoConstraints = false
		return stack
	}()
	
	lazy var activityLevelStack: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [self.definitionsTitle, self.definitionsText])
		stack.axis = .vertical
		stack.spacing = 10
		stack.distribution = .fillProportionally
		stack.translatesAutoresizingMaskIntoConstraints = false
		return stack
	}()
	
	var dismissLabel: UILabel = {
		let label = UILabel()
		label.text = "Tap to dismiss"
		label.textColor = UIColor.alcBlue
		label.textAlignment = .center
		label.font = UIFont.systemFont(ofSize: 14)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = UIColor.alcWhite
		addViews()
	}
	
	func addViews() {
		addSubview(dismissLabel)
		let stack = UIStackView(arrangedSubviews: [mainTitle, equationStack, activityLevelStack])
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.axis = .vertical
		stack.distribution = .fillProportionally
		stack.spacing = 40
		addSubview(stack)
		
		dismissLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		dismissLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
		dismissLabel.bottomAnchor.constraint(equalTo: stack.topAnchor, constant: -32).isActive = true
		
		stack.topAnchor.constraint(equalTo: dismissLabel.bottomAnchor, constant: 32).isActive = true
		stack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40).isActive = true
		stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
		stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

class AlcoholPopupView: UIView {
	var mainTitle = TitleTextLabel(ofText: "Alcohol Calculations Explained")
	
	var equationSubTitle = SubTitleTextLabel(ofText: "Equation Explained")
	var equationText = RegularTextLabel(ofText: """
Equation for Calories to Fat Macros:
Fats = ((Current Value % * 0.01) * Calories) / 9

Equation for Calories to Carb Macros:
Carbs = ((Current Value % * 0.01) * Calories) / 4

Equation for ABV and Percent to Fat Macros:
Fats = (Ounces * (Percent * 2.5)) * (Percent * 0.01) / 9

Equation for ABV and Percent to Carb Marcos:
Carbs = (Ounces * (Percent * 2.5)) * (Percent * 0.01) / 4
"""
	)
	
	var definitionsTitle = SubTitleTextLabel(ofText: "Definitions Explained")
	var definitionsText = RegularTextLabel(ofText: """
Calorie Conversion:
We're taking the caloric value of an alcoholic beverage and converting those calories into a proportional fats/ carbs value.

ABV %:
Is a standard measure of how much alcohol (ethanol) is contained in a given volume of an alcoholic beverage.

Ounces:
The liquid ounces of the amount of alcohol you consumed. 
"""
	)
	
	lazy var equationStack: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [self.equationSubTitle, self.equationText])
		stack.axis = .vertical
		stack.spacing = 10
		stack.distribution = .fillProportionally
		stack.translatesAutoresizingMaskIntoConstraints = false
		return stack
	}()
	
	lazy var activityLevelStack: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [self.definitionsTitle, self.definitionsText])
		stack.axis = .vertical
		stack.spacing = 10
		stack.distribution = .fillProportionally
		stack.translatesAutoresizingMaskIntoConstraints = false
		return stack
	}()
	
	var dismissLabel: UILabel = {
		let label = UILabel()
		label.text = "Tap to dismiss"
		label.textColor = UIColor.alcBlue
		label.textAlignment = .center
		label.font = UIFont.systemFont(ofSize: 14)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = UIColor.alcWhite
		addViews()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func addViews() {
		addSubview(dismissLabel)
		let stack = UIStackView(arrangedSubviews: [mainTitle, equationStack, activityLevelStack])
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.axis = .vertical
		stack.distribution = .fillProportionally
		stack.spacing = 40
		addSubview(stack)
		
		dismissLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		dismissLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
		dismissLabel.bottomAnchor.constraint(equalTo: stack.topAnchor, constant: -32).isActive = true
		
		stack.topAnchor.constraint(equalTo: dismissLabel.bottomAnchor, constant: 32).isActive = true
		stack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40).isActive = true
		stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
		stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
	}
}
