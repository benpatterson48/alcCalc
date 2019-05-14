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
    
    func calcProtein(weight: Int) -> Int {
        let protein = weight * 1
        return protein
    }
    
    func calcCarbs(protein: Int, fats: Int, maintenanceCals: Int) -> Int {
        let proteinCals = protein * 4
        let fatCals = fats * 9
        let cals = proteinCals + fatCals
        let remainingCals = maintenanceCals - cals
        let carbs = remainingCals / 4
        return carbs
    }
    
    func calcFats(goalCals: Int) -> Int {
        let fatCals = Double(goalCals) * 0.3
        print("This is our fat cals: \(fatCals)")
        let fats = fatCals / 9
        return Int(fats)
    }
    
    func calcMaintenanceCals(weight: Int, goalSpeed: Int) -> Int {
        let maintenanceCals = weight * goalSpeed
        return maintenanceCals
    }
    
    func calcGoalCals(maintenanceCals: Int, bodyCompGoal: Int) -> Int {
        let goalCals = maintenanceCals + bodyCompGoal
        return goalCals
    }
    
}
