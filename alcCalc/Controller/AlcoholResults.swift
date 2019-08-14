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
		addViews()
		addButtonTargets()
		view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3)
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
			contentView.carbButton.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
			contentView.carbButton.titleLabel?.textColor = .white
			contentView.fatButton.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
			contentView.fatButton.titleLabel?.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.5)
		} else {
			carsbSelected = false
			fatsSelected = true
			outputSelected = "Fats"
			sliderValueChanging(contentView.slider)
			contentView.fatButton.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
			contentView.fatButton.titleLabel?.textColor = .white
			contentView.carbButton.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
			contentView.carbButton.titleLabel?.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.5)
		}
	}
	
	@objc func roundedOrDecimalOptionWasChanged() {
		if roundedSelected == true {
			roundedSelected = false
			contentView.roundedButton.setTitleColor(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), for: .normal)
			contentView.roundedButton.titleLabel?.font = UIFont.mainFont(ofSize: 16)
			contentView.decimalButton.setTitleColor(#colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1), for: .normal)
			contentView.decimalButton.titleLabel?.font = UIFont.mainSemiBoldFont(ofSize: 18)
			sliderValueChanging(contentView.slider)
		} else {
			roundedSelected = true
			contentView.decimalButton.setTitleColor(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), for: .normal)
			contentView.decimalButton.titleLabel?.font = UIFont.mainFont(ofSize: 18)
			contentView.roundedButton.setTitleColor(#colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1), for: .normal)
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
