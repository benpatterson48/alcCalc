//
//  AlcCalculations.swift
//  alcCalc
//
//  Created by Ben Patterson on 8/13/19.
//  Copyright © 2019 Ben Patterson. All rights reserved.
//

import Foundation


class AlcCalculations {
	
	static let instance = AlcCalculations() 
	
	func calculateMacros(calories: Double, value: Int, gramsConversion: Double, roundedSelected: Bool) -> Double {
		if value == 100 {
			let remainder = Double(value) * 0.01
			let calories = remainder * calories
			let macrosDecimals = calories / gramsConversion
			if roundedSelected == true {
				let macros = macrosDecimals.rounded(digits: 0)
				return macros
			} else {
				let macros = macrosDecimals.rounded(digits: 1)
				return macros
			}
		} else {
			let wholeRemainder: Double = Double(value % 100)
			let remainder = wholeRemainder * 0.01
			let calories = remainder * calories
			let macrosDecimals = calories / gramsConversion
			if roundedSelected == true {
				let macros = macrosDecimals.rounded(digits: 0)
				return macros
			} else {
				let macros = macrosDecimals.rounded(digits: 1)
				return macros
			}
		}
	}
	
	func calculateABVMacros(ounces: Double, percent: Double, value: Int, gramsConversion: Double, roundedSelected: Bool) -> Double {
		if value == 100 {
			let abvCalories = ounces * (percent * 2.5)
			let remainder: Double = Double(value) * 0.01
			let abvCalcCalories = abvCalories * remainder
			let macrosDecimals = abvCalcCalories / gramsConversion
			if roundedSelected == true {
				let macros = macrosDecimals.rounded(digits: 0)
				return macros
			} else {
				let macros = macrosDecimals.rounded(digits: 1)
				return macros
			}
		} else {
			let abvCalories = ounces * (percent * 2.5)
			let wholeRemainder: Double = Double(value % 100)
			let remainder = wholeRemainder * 0.01
			let abvCalcCalories = abvCalories * remainder
			let macrosDecimals = abvCalcCalories / gramsConversion
			if roundedSelected == true {
				let macros = macrosDecimals.rounded(digits: 0)
				return macros
			} else {
				let macros = macrosDecimals.rounded(digits: 1)
				return macros
			}
		}
	}
	
}
