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
	var tabHeight = CGFloat()
	var segment = UISegmentedControl()
	let alcoholView = AlcoholContentView()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		addViews()
		setDoneOnKeyboard()
		view.bindToKeyboard()
		view.backgroundColor = UIColor.alcWhite
		topView.backgroundColor = UIColor.alcWhite
		
		alcoholView.abvView.ouncesInputView.textField.keyboardType = .decimalPad
		alcoholView.abvView.abvPercentInputView.textField.keyboardType = .decimalPad
		
		self.tabHeight = tabBarController?.tabBar.bounds.size.height ?? 0
		
		scrollView.bounces = false
		scrollView.showsVerticalScrollIndicator = false
		
		self.segment = alcoholView.methodSwitch
		segment.addTarget(self, action: #selector(segmentedControllerIndexChanged(_:)), for: .valueChanged)
		alcoholView.calculateButton.addTarget(self, action: #selector(calculateButtonWasPressed), for: .touchUpInside)
		alcoholView.infoButton.addTarget(self, action: #selector(showPopupView), for: .touchUpInside)
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
		segment.selectedSegmentIndex = 0
		scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.contentView.frame.height)
		scrollView.frame = CGRect(x: 0, y: 24, width: self.view.frame.width, height: (self.view.frame.height - tabHeight) - 24)
	}
	
	func setDoneOnKeyboard() {
		let calories = alcoholView.calorieView.calorieInputView.textField
		let ounces = alcoholView.abvView.ouncesInputView.textField
		let percent = alcoholView.abvView.abvPercentInputView.textField
		
		let keyboardToolbar = UIToolbar()
		keyboardToolbar.sizeToFit()
		let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
		let doneBarButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissKeyboard))
		keyboardToolbar.items = [flexBarButton, doneBarButton]
		calories.inputAccessoryView = keyboardToolbar
		ounces.inputAccessoryView = keyboardToolbar
		percent.inputAccessoryView = keyboardToolbar
	}
	
	@objc func dismissKeyboard() {
		view.endEditing(true)
	}
	
	@objc func showPopupView() {
		let view = AlcoholPopupView()
		let popup = PopupVC(viewfor: view)
		if #available(iOS 13, *) {
			popup.modalPresentationStyle = .formSheet
		} else {
			popup.modalPresentationStyle = .overCurrentContext
			popup.modalTransitionStyle = .crossDissolve
		}
		present(popup, animated: true, completion: nil)
	}
	
	@objc func calculateButtonWasPressed() {
		let alcoholResults = AlcoholResults()
		if #available(iOS 13, *) {
			alcoholResults.modalPresentationStyle = .pageSheet
		} else {
			alcoholResults.modalPresentationStyle = .overCurrentContext
		}
		if caloriesSelected == true {
			if alcoholView.calorieView.calorieInputView.textField.text != "" {
				view.endEditing(true)
				let calories = Double(alcoholView.calorieView.calorieInputView.textField.text!)
				alcoholResults.initDataForCalories(caloriesSent: calories ?? 0)
				present(alcoholResults, animated: true, completion: nil)
			} else {
				view.endEditing(true)
				showIncompleteInputsAlert()
			}
		} else if abvSelected == true {
			if alcoholView.abvView.abvPercentInputView.textField.text != "" && alcoholView.abvView.ouncesInputView.textField.text != "" {
				view.endEditing(true)
				let ounces = Double(alcoholView.abvView.ouncesInputView.textField.text!)
				let percent = Double(alcoholView.abvView.abvPercentInputView.textField.text!)
				alcoholResults.initDataForABV(ounces: ounces ?? 0, percent: percent ?? 0)
				present(alcoholResults, animated: true, completion: nil)
			} else {
				view.endEditing(true)
				showIncompleteInputsAlert()
			}
		}
	}
	
	func showIncompleteInputsAlert() {
		let alert = UIAlertController(title: "Incomplete Fields", message: "Please complete the form before trying to calculate", preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
		present(alert, animated: true, completion: nil)
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
		scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
		scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
		scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		
		contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
		contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
		contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
		contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
		
		alcoholView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 32).isActive = true
		alcoholView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32).isActive = true
		alcoholView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32).isActive = true
		alcoholView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
	}
	
}
