//
//  MacroResults.swift
//  alcCalc
//
//  Created by Ben Patterson on 8/12/19.
//  Copyright © 2019 Ben Patterson. All rights reserved.
//

import UIKit

class MacroResults: UIViewController {
	
	var contentView = MacroResultsView()
	var calculate = Calculations.instance
	
	var deficitSelected: Bool = true
	var surplusSelected: Bool = true
	var maintenanceSelected: Bool = false
	
	var age = Double()
	var weightKG = Double()
	var heightFeet = Double()
	var maleSelected = Bool()
	var genderDouble = Double()
	var weightPounds = Double()
	var heightInches = Double()
	var macroGoalsDouble = Double()
	var heightCentimeters = Double()
	var activityMultiplier = Double()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		addButtonTargets()
		
		if #available(iOS 13, *) {
			addViewsForiOS13()
			view.backgroundColor = UIColor.clear
		} else {
			addViews()
			view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3)
		}
	}
	
	func addButtonTargets() {
		contentView.ctaButton.addTarget(self, action: #selector(ctaButtonWasClicked), for: .touchUpInside)
		contentView.macroGoals.addTarget(self, action: #selector(segmentedControllerIndexChanged(_:)), for: .valueChanged)
		contentView.closeButton.addTarget(self, action: #selector(closeOutModalButtonPressed), for: .touchUpInside)
	}
	
	@objc func ctaButtonWasClicked() {
		if let url = URL(string: "https://flexibledietinglifestyle.com/the-perfect-macro-calculator/") {
			UIApplication.shared.open(url, options: [:])
		} else {
			let alert = UIAlertController(title: "Error", message: "Sorry, we couldn't open this link right now, please try again later", preferredStyle: .alert)
			let dismiss = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
			alert.addAction(dismiss)
			present(alert, animated: true, completion: nil)
		}
	}
	
	func initData(age: Double, weightPounds: Double, heightFeet: Double, heightInches: Double, maleSelected: Bool, activityMultiplier: Double) {
		self.activityMultiplier = activityMultiplier
		self.maleSelected = maleSelected
		self.heightInches = heightInches
		self.heightFeet = heightFeet
		self.weightPounds = weightPounds
		self.age = age
		
		self.weightKG = calculate.convertWeightToKG(pounds: weightPounds)
		self.heightCentimeters = calculate.convertHeightToCentimeters(feet: heightFeet, inches: heightInches)
		
		if maleSelected == true {
			self.genderDouble = 5
		} else {
			self.genderDouble = -161
		}
		
		if deficitSelected == true {
			self.macroGoalsDouble = calculate.calculateDeficitCalories(pounds: weightPounds)
		} else if maintenanceSelected == true {
			self.macroGoalsDouble = 0
		} else {
			self.macroGoalsDouble = 400
		}
		
		updateValues()
	}
	
	func updateValues() {
		if deficitSelected == true {
			self.macroGoalsDouble = calculate.calculateDeficitCalories(pounds: weightPounds)
		} else if maintenanceSelected == true {
			self.macroGoalsDouble = 0
		} else {
			self.macroGoalsDouble = 400
		}
		
		let resting = calculate.calculateRestingCalories(weight: weightKG, height: heightCentimeters, age: age, genderDouble: genderDouble)
		let tdee = calculate.calculateTDEECalories(restingCalories: resting, activityMultiplier: activityMultiplier)
		let goal = calculate.calculateGoalCalories(tdeeCalories: tdee, macroGoalsDoulbe: macroGoalsDouble)
		
		//add male selected to protein calc check
		let protein = calculate.calculateProtein(weight: weightPounds, deficit: deficitSelected)
		let adjustedProtein = calculate.checkMaxProteinLimimts(protein: protein, maleSelected: maleSelected)
		let fat = calculate.calculateFats(goalCals: goal)
		let carb = calculate.calculateCarbs(protein: adjustedProtein, fats: fat, goalCals: goal)
		
		contentView.tdeeResult.text = String(Int(tdee))
		contentView.goalResult.text = String(Int(goal))
		contentView.restingResult.text = String(Int(resting))
		
		contentView.proteinResult.text = String(Int(adjustedProtein))
		contentView.carbResult.text = String(Int(carb))
		contentView.fatResult.text = String(Int(fat))
	}
	
	fileprivate func addViews() {
		view.addSubview(contentView)
		contentView.translatesAutoresizingMaskIntoConstraints = false
		addConstraints()
	}
	
	func addViewsForiOS13() {
		view.addSubview(contentView)
		contentView.translatesAutoresizingMaskIntoConstraints = false
		
		contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
		contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
	}
	
	@objc func segmentedControllerIndexChanged(_ sender: UISegmentedControl) {
		switch sender.selectedSegmentIndex {
		case 0:
			deficitSelected = true
			surplusSelected = false
			maintenanceSelected = false
			updateValues()
		case 1:
			deficitSelected = false
			surplusSelected = false
			maintenanceSelected = true
			updateValues()
		case 2:
			deficitSelected = false
			surplusSelected = true
			maintenanceSelected = false
			updateValues()
		default:
			deficitSelected = true
			surplusSelected = false
			maintenanceSelected = false
			updateValues()
		}
	}
	
	@objc func closeOutModalButtonPressed() {
		dismiss(animated: true, completion: nil)
	}
	
	fileprivate func addConstraints() {
		contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
		contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
	}

}
