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
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.7)
		addViews()
		addResultAmounts()
	}
	
	fileprivate func addViews() {
		view.addSubview(contentView)
		contentView.translatesAutoresizingMaskIntoConstraints = false
		addConstraints()
	}
	
	fileprivate func addResultAmounts() {
		contentView.tdeeResult.text = "2,300"
		contentView.goalResult.text = "1,700"
		contentView.restingResult.text = "2,100"
		
		contentView.proteinResult.text = "175"
		contentView.carbResult.text = "320"
		contentView.fatResult.text = "75"
	}
	
	fileprivate func addConstraints() {
		contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
		contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
	}
	
	
	
}
