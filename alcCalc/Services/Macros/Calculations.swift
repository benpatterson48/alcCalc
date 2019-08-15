//
//  Calculations.swift
//  alcCalc
//
//  Created by Ben Patterson on 5/14/19.
//  Copyright © 2019 Ben Patterson. All rights reserved.
//

import UIKit

class Calculations {
	
	static let instance = Calculations()
	
	func calculateProtein(weight: Double) -> Double {
		let protein = weight * 1
		return protein
	}
	
	func calculateCarbs(protein: Double, fats: Double, goalCals: Double) -> Double {
		let proteinCals = protein * 4
		let fatCals = fats * 9
		let cals = proteinCals + fatCals
		let remainingCals = goalCals - cals
		let carbs = remainingCals / 4
		return carbs
	}
	
	func calculateFats(goalCals: Double) -> Double {
		let fatCals = goalCals * 0.3
		let fats = fatCals / 9
		return Double(fats)
	}
	
	func calculateRestingCalories(weight: Double, height: Double, age: Double, genderDouble: Double) -> Double {
		let resting = (10 * weight) + (6.25 * height) - (5 * age) + genderDouble
		return resting
	}
	
	func calculateTDEECalories(restingCalories: Double, activityMultiplier: Double) -> Double {
		let tdee = restingCalories * activityMultiplier
		return tdee
	}
	
	func calculateGoalCalories(tdeeCalories: Double, macroGoalsDoulbe: Double) -> Double {
		let goal = tdeeCalories + macroGoalsDoulbe
		return goal
	}
	
	func convertHeightToCentimeters(feet: Double, inches: Double) -> Double {
		let inches = (feet * 12) + inches
		let converted = inches * 2.54
		return converted
	}
	
	func convertWeightToKG(pounds: Double) -> Double {
		let kg = pounds / 2.2
		return kg
	}
	
}
	

