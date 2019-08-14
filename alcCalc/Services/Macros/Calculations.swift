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
    
    func calculateProtein(weight: Int) -> Int {
        let protein = weight * 1
        return protein
    }
    
    func calculateCarbs(protein: Int, fats: Int, goalCals: Int) -> Int {
        let proteinCals = protein * 4
        let fatCals = fats * 9
        let cals = proteinCals + fatCals
        let remainingCals = goalCals - cals
        let carbs = remainingCals / 4
        return carbs
    }
    
    func calculateFats(goalCals: Int) -> Int {
        let fatCals = Double(goalCals) * 0.3
        let fats = fatCals / 9
        return Int(fats)
    }
    
	func calculateRestingCalories(weight: Double, height: Double, age: Double, genderDouble: Double) -> Double {
		return 10 * weight + 6.25 * height - 5 * age + genderDouble
    }
    
    func calculateTDEECalories(restingCalories: Double, activityMultiplier: Double) -> Double {
        return restingCalories * activityMultiplier
    }

	func calculateGoalCalories(tdeeCalories: Double, macroGoalsDoulbe: Double) -> Double {
		return tdeeCalories + macroGoalsDoulbe
	}
	
	func convertHeightToCentimeters(feet: Double, inches: Double) -> Double {
		let inches = (feet * 12) + inches
		return inches * 2.54 
	}
	
	func convertWeightToKG(pounds: Double) -> Double {
		return pounds / 2.2
	}
    
}
