//
//  AlcoholResults.swift
//  alcCalc
//
//  Created by Ben Patterson on 8/13/19.
//  Copyright © 2019 Ben Patterson. All rights reserved.
//

import UIKit

class AlcoholResults: UIViewController {
	
	var ounces: Double?
	var percent: Double?
	var calories: Double?
	var abvSelected: Bool?
	var caloriesSelected: Bool?
	var fatsSelected: Bool = true
	var carsbSelected: Bool = false
	var roundedSelected: Bool = true
	var outputSelected: String = "Fats"
	var contentView = AlcoholResultsView()
	
	func initDataForCalories(caloriesSent: Double) {
		caloriesSelected = true
		self.calories = caloriesSent
		contentView.inputsLabel.text = "Cals: \(calories!)"
	}
	
	func initDataForABV(ounces: Double, percent: Double) {
		abvSelected = true
		self.ounces = ounces
		self.percent = percent
		contentView.sliderPercentValueLabel.font = UIFont.mainMediumFont(ofSize: 16)
		contentView.inputsLabel.text = "Oz: \(self.ounces!), %: \(self.percent!)"
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		if #available(iOS 13, *) {
			view.backgroundColor = UIColor.clear
		} else {
			view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3)
		}
		addViews()
		addButtonTargets()
		sliderValueChanging(contentView.slider)
	}
	
	func addButtonTargets() {
		contentView.slider.addTarget(self, action: #selector(sliderValueChanging(_:)), for: .valueChanged)
		
		contentView.closeButton.addTarget(self, action: #selector(closeOutModalButtonPressed), for: .touchUpInside)
		
		contentView.carbButton.addTarget(self, action: #selector(outputPreferenceWasChanged), for: .touchUpInside)
		contentView.fatButton.addTarget(self, action: #selector(outputPreferenceWasChanged), for: .touchUpInside)
		
		contentView.roundedButton.addTarget(self, action: #selector(roundedOrDecimalOptionWasChanged), for: .touchUpInside)
		contentView.decimalButton.addTarget(self, action: #selector(roundedOrDecimalOptionWasChanged), for: .touchUpInside)
	}

	fileprivate func addViews() {
		view.addSubview(contentView)
		contentView.translatesAutoresizingMaskIntoConstraints = false
		addConstraints()
	}

	fileprivate func addConstraints() {
		contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
		contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
	}
	
	@objc func closeOutModalButtonPressed() {
		dismiss(animated: true, completion: nil)
	}
	
	@objc func outputPreferenceWasChanged() {
		if fatsSelected == true {
			carsbSelected = true
			fatsSelected = false
			outputSelected = "Carbs"
			sliderValueChanging(contentView.slider)
			contentView.carbButton.backgroundColor = UIColor.alcBlue
			contentView.carbButton.titleLabel?.textColor = UIColor.alcWhite
			contentView.fatButton.backgroundColor = UIColor.lightText.withAlphaComponent(0.30)
			contentView.fatButton.titleLabel?.textColor = UIColor.lightText
		} else {
			carsbSelected = false
			fatsSelected = true
			outputSelected = "Fats"
			sliderValueChanging(contentView.slider)
			contentView.fatButton.backgroundColor = UIColor.alcBlue
			contentView.fatButton.titleLabel?.textColor = UIColor.alcWhite
			contentView.carbButton.backgroundColor = UIColor.lightText.withAlphaComponent(0.30)
			contentView.carbButton.titleLabel?.textColor = UIColor.lightText
		}
	}
	
	@objc func roundedOrDecimalOptionWasChanged() {
		if roundedSelected == true {
			roundedSelected = false
			contentView.roundedButton.setTitleColor(UIColor.lightText.withAlphaComponent(0.50), for: .normal)
			contentView.roundedButton.titleLabel?.font = UIFont.mainFont(ofSize: 16)
			contentView.decimalButton.setTitleColor(UIColor.alcBlue, for: .normal)
			contentView.decimalButton.titleLabel?.font = UIFont.mainSemiBoldFont(ofSize: 18)
			sliderValueChanging(contentView.slider)
		} else {
			roundedSelected = true
			contentView.decimalButton.setTitleColor(UIColor.lightText.withAlphaComponent(0.50), for: .normal)
			contentView.decimalButton.titleLabel?.font = UIFont.mainFont(ofSize: 18)
			contentView.roundedButton.setTitleColor(UIColor.alcBlue, for: .normal)
			contentView.roundedButton.titleLabel?.font = UIFont.mainSemiBoldFont(ofSize: 16)
			sliderValueChanging(contentView.slider)
		}
	}
	
	@objc func sliderValueChanging(_ sender: UISlider) {
		let currentValue = Int(sender.value)
		let remainderValue = 100 - currentValue
		contentView.sliderPercentValueLabel.text = "\(currentValue)% \(outputSelected)"
		if caloriesSelected == true {
			if fatsSelected == true {
				contentView.fatResultsLabel.text = "\(AlcCalculations.instance.calculateMacros(calories: self.calories!, value: currentValue, gramsConversion: 9, roundedSelected: roundedSelected))g"
				contentView.cabResultsLabel.text = "\(AlcCalculations.instance.calculateMacros(calories: self.calories!, value: remainderValue, gramsConversion: 4, roundedSelected: roundedSelected))g"
			} else {
				contentView.fatResultsLabel.text = "\(AlcCalculations.instance.calculateMacros(calories: self.calories!, value: remainderValue, gramsConversion: 9, roundedSelected: roundedSelected))g"
				contentView.cabResultsLabel.text = "\(AlcCalculations.instance.calculateMacros(calories: self.calories!, value: currentValue, gramsConversion: 4, roundedSelected: roundedSelected))g"
			}
		} else {
			if fatsSelected == true {
				contentView.fatResultsLabel.text = "\(AlcCalculations.instance.calculateABVMacros(ounces: self.ounces!, percent: self.percent!, value: currentValue, gramsConversion: 9, roundedSelected: roundedSelected))g"
				contentView.cabResultsLabel.text = "\(AlcCalculations.instance.calculateABVMacros(ounces: self.ounces!, percent: self.percent!, value: remainderValue, gramsConversion: 4, roundedSelected: roundedSelected))g"
			} else {
				contentView.fatResultsLabel.text = "\(AlcCalculations.instance.calculateABVMacros(ounces: self.ounces!, percent: self.percent!, value: remainderValue, gramsConversion: 9, roundedSelected: roundedSelected))g"
				contentView.cabResultsLabel.text = "\(AlcCalculations.instance.calculateABVMacros(ounces: self.ounces!, percent: self.percent!, value: currentValue, gramsConversion: 4, roundedSelected: roundedSelected))"
			}
		}
	}
	
}
