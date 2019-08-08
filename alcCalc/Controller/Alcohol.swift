//
//  Alcohol.swift
//  alcCalc
//
//  Created by Ben Patterson on 8/6/19.
//  Copyright © 2019 Ben Patterson. All rights reserved.
//

import UIKit

class Alcohol: UIViewController {
	
	var caloriesSelected: Bool = true
	var abvSelected: Bool = false
	var scrollView = UIScrollView()
	var contentView = UIView()
	
	var topView = UIView()
	let alcoholView = AlcoholContentView()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		addViews()
		view.bindToKeyboard()
		view.backgroundColor = .white
		topView.backgroundColor = .white
		
		scrollView.bounces = false
		scrollView.showsVerticalScrollIndicator = false
		
		let segment = alcoholView.methodSwitch
		segment.addTarget(self, action: #selector(segmentedControllerIndexChanged(_:)), for: .valueChanged)
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
		scrollView.contentSize = CGSize(width: self.view.frame.width, height: 1300)
		scrollView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
	}
	
	@objc func segmentedControllerIndexChanged(_ sender: UISegmentedControl) {
		switch sender.selectedSegmentIndex {
		case 0:
			caloriesSelected = true
			abvSelected = false
			toggleBetweenCaloriesAndAbvMethod()
		case 1:
			caloriesSelected = false
			abvSelected = true
			toggleBetweenCaloriesAndAbvMethod()
		default:
			caloriesSelected = true
			abvSelected = false
			toggleBetweenCaloriesAndAbvMethod()
		}
	}
	
	func toggleBetweenCaloriesAndAbvMethod() {
		if caloriesSelected == true {
			self.alcoholView.abvView.isHidden = true
			UIView.animate(withDuration: 0.2, delay: 0.0 ,animations: {
				self.alcoholView.calorieView.isHidden = false
				self.alcoholView.methodExplanation.text = "We're using the caloric value of the beverage to convert the consumption into easy to track fat and carb macronutrients."
				self.alcoholView.methodExplanation.attributedText = self.alcoholView.methodExplanation.text?.increaseLineSpacing()
			}
			)} else {
			self.alcoholView.calorieView.isHidden = true
			UIView.animate(withDuration: 0.2, delay: 0.0 ,animations: {
				self.alcoholView.abvView.isHidden = false
				self.alcoholView.methodExplanation.text = "We're using the volume of the beverage and the alcoholic percentage to convert the consumption into easy to track fat and carb macronutrients."
				self.alcoholView.methodExplanation.attributedText = self.alcoholView.methodExplanation.text?.increaseLineSpacing()
			}
			)}
	}
	
	fileprivate func addViews() {
		view.addSubview(scrollView)
		view.addSubview(topView)
		scrollView.addSubview(contentView)
		contentView.addSubview(alcoholView)
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		topView.translatesAutoresizingMaskIntoConstraints = false
		contentView.translatesAutoresizingMaskIntoConstraints = false
		alcoholView.translatesAutoresizingMaskIntoConstraints = false
		
		topView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
		topView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		topView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
		topView.heightAnchor.constraint(equalToConstant: 24).isActive = true
		topView.bottomAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
		
		scrollView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
		scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
		scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
		scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		
		contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
		contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
		contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
		contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
		
		alcoholView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 24).isActive = true
		alcoholView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32).isActive = true
		alcoholView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32).isActive = true
		alcoholView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
	}
	
}
