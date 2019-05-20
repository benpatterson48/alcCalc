//
//  ResultsView.swift
//  alcCalc
//
//  Created by Ben Patterson on 5/15/19.
//  Copyright © 2019 Ben Patterson. All rights reserved.
//

import UIKit

class ResultsView: UIView {
    
    let maintenanceCalsLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Maintenance"
        lbl.numberOfLines = 0
        lbl.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.5)
        lbl.textAlignment = .center
        lbl.font = UIFont.mainMediumFont(ofSize: 16)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let maintenanceResultLbl: UILabel = {
        let lbl = UILabel()
        lbl.textColor = #colorLiteral(red: 0, green: 0.6745098039, blue: 0.9294117647, alpha: 1)
        lbl.textAlignment = .center
        lbl.font = UIFont.mainSemiBoldFont(ofSize: 40)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let goalCalsLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Target"
        lbl.numberOfLines = 0
        lbl.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.5)
        lbl.textAlignment = .center
        lbl.font = UIFont.mainMediumFont(ofSize: 16)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let goalResultLbl: UILabel = {
        let lbl = UILabel()
        lbl.textColor = #colorLiteral(red: 0, green: 0.6745098039, blue: 0.9294117647, alpha: 1)
        lbl.textAlignment = .center
        lbl.font = UIFont.mainSemiBoldFont(ofSize: 40)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let proteinTitleLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Protein (g)"
        lbl.numberOfLines = 0
        lbl.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.5)
        lbl.textAlignment = .center
        lbl.font = UIFont.mainMediumFont(ofSize: 16)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let proteinResultsLbl: UILabel = {
        let lbl = UILabel()
        lbl.textColor = #colorLiteral(red: 0, green: 0.6745098039, blue: 0.9294117647, alpha: 1)
        lbl.textAlignment = .center
        lbl.font = UIFont.mainSemiBoldFont(ofSize: 32)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let carbTitleLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Carbs (g)"
        lbl.numberOfLines = 0
        lbl.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.5)
        lbl.textAlignment = .center
        lbl.font = UIFont.mainMediumFont(ofSize: 16)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let carbsResultsLbl: UILabel = {
        let lbl = UILabel()
        lbl.textColor = #colorLiteral(red: 0, green: 0.6745098039, blue: 0.9294117647, alpha: 1)
        lbl.textAlignment = .center
        lbl.font = UIFont.mainSemiBoldFont(ofSize: 32)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let fatTitleLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Fats (g)"
        lbl.numberOfLines = 0
        lbl.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.5)
        lbl.textAlignment = .center
        lbl.font = UIFont.mainMediumFont(ofSize: 16)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let fatsResultsLbl: UILabel = {
        let lbl = UILabel()
        lbl.textColor = #colorLiteral(red: 0, green: 0.6745098039, blue: 0.9294117647, alpha: 1)
        lbl.textAlignment = .center
        lbl.font = UIFont.mainSemiBoldFont(ofSize: 32)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        constructStackViews()
    }
    
    func constructStackViews() {
        let maintenanceStackView = UIStackView(arrangedSubviews: [maintenanceCalsLbl, maintenanceResultLbl])
        maintenanceStackView.translatesAutoresizingMaskIntoConstraints = false
        maintenanceStackView.axis = .vertical
        maintenanceStackView.spacing = 5
        maintenanceStackView.distribution = .fillProportionally
        let goalStackView = UIStackView(arrangedSubviews: [goalCalsLbl, goalResultLbl])
        goalStackView.translatesAutoresizingMaskIntoConstraints = false
        goalStackView.axis = .vertical
        goalStackView.spacing = 5
        goalStackView.distribution = .fillProportionally
        let proteinStackView = UIStackView(arrangedSubviews: [proteinResultsLbl, proteinTitleLbl])
        proteinStackView.translatesAutoresizingMaskIntoConstraints = false
        proteinStackView.axis = .vertical
        proteinStackView.spacing = 10
        proteinStackView.distribution = .fillProportionally
        let carbsStackView = UIStackView(arrangedSubviews: [carbsResultsLbl, carbTitleLbl])
        carbsStackView.translatesAutoresizingMaskIntoConstraints = false
        carbsStackView.axis = .vertical
        carbsStackView.spacing = 10
        carbsStackView.distribution = .fillProportionally
        let fatsStackView = UIStackView(arrangedSubviews: [fatsResultsLbl, fatTitleLbl])
        fatsStackView.translatesAutoresizingMaskIntoConstraints = false
        fatsStackView.axis = .vertical
        fatsStackView.spacing = 10
        fatsStackView.distribution = .fillProportionally
        let caloriesStackView = UIStackView(arrangedSubviews: [maintenanceStackView, goalStackView])
        caloriesStackView.axis = .horizontal
        caloriesStackView.distribution = .fillEqually
        caloriesStackView.alignment = .fill
        caloriesStackView.translatesAutoresizingMaskIntoConstraints = false
        let macrosStackView = UIStackView(arrangedSubviews: [proteinStackView, carbsStackView, fatsStackView])
        macrosStackView.axis = .horizontal
        macrosStackView.distribution = .fillEqually
        macrosStackView.alignment = .fill
        macrosStackView.translatesAutoresizingMaskIntoConstraints = false
        let combinedStackView = UIStackView(arrangedSubviews: [caloriesStackView, macrosStackView])
        combinedStackView.translatesAutoresizingMaskIntoConstraints = false
        combinedStackView.axis = .vertical
        combinedStackView.distribution = .fillEqually
        combinedStackView.spacing = 50
        
        addSubview(combinedStackView)
        combinedStackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        combinedStackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        combinedStackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        combinedStackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}