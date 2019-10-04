//
//  Macros.swift
//  alcCalc
//
//  Created by Ben Patterson on 8/6/19.
//  Copyright © 2019 Ben Patterson. All rights reserved.
//

import UIKit

var activityIndicatorSelected: Double = 1.2 
class Macros: UIViewController, UIScrollViewDelegate {
	
	var scrollView = UIScrollView()
	var contentView = UIView()
	
	var maleSelected: Bool = true
	var femaleSelected: Bool = false
	
	var tabHeight = CGFloat()
	
	var topView = UIView()
	let macrosView = MacrosContentView()
	
	override func viewDidLoad() {
        super.viewDidLoad()
		addViews()
		setDoneOnKeyboard()
		view.backgroundColor = UIColor.alcWhite
		topView.backgroundColor = UIColor.alcWhite

		self.tabHeight = tabBarController?.tabBar.bounds.size.height ?? 0
		
		scrollView.bounces = false
		scrollView.showsVerticalScrollIndicator = false
		macrosView.genderSwitch.addTarget(self, action: #selector(segmentedControllerIndexChanged(_:)), for: .valueChanged)
		macrosView.calculateButton.addTarget(self, action: #selector(calculateButtonWasPressed), for: .touchUpInside)
		macrosView.infoButton.addTarget(self, action: #selector(showPopupView), for: .touchUpInside)
	}
	
	func setDoneOnKeyboard() {
		let feet = macrosView.heightFeetInputView.textField
		let inches = macrosView.heightInchesInputView.textField
		let age = macrosView.ageInputView.textField
		let weight = macrosView.weightInputView.textField
		
		let keyboardToolbar = UIToolbar()
		keyboardToolbar.sizeToFit()
		let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
		let doneBarButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissKeyboard))
		keyboardToolbar.items = [flexBarButton, doneBarButton]
		feet.inputAccessoryView = keyboardToolbar
		inches.inputAccessoryView = keyboardToolbar
		age.inputAccessoryView = keyboardToolbar
		weight.inputAccessoryView = keyboardToolbar
	}
	
	@objc func dismissKeyboard() {
		view.endEditing(true)
	}
	
	@objc func showPopupView() {
		let view = MacroPopupView()
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
		let results = MacroResults()
		if #available(iOS 13, *) {
			results.modalPresentationStyle = .pageSheet
		} else {
			results.modalPresentationStyle = .overCurrentContext
		}
		if macrosView.ageInputView.textField.text != "" && macrosView.weightInputView.textField.text != "" && macrosView.heightFeetInputView.textField.text != "" && macrosView.heightInchesInputView.textField.text != "" {
			let age = Double(macrosView.ageInputView.textField.text!)
			let weight = Double(macrosView.weightInputView.textField.text!)
			let heightFeet = Double(macrosView.heightFeetInputView.textField.text!)
			let heghtInches = Double(macrosView.heightInchesInputView.textField.text!)
			let activity = activityIndicatorSelected
			results.initData(age: age ?? 0, weightPounds: weight ?? 0, heightFeet: heightFeet ?? 0, heightInches: heghtInches ?? 0, maleSelected: maleSelected, activityMultiplier: activity)
			present(results, animated: true, completion: nil)
		} else {
			showIncompleteInputsAlert()
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
			maleSelected = true
			femaleSelected = false
		case 1:
			maleSelected = false
			femaleSelected = true
		default:
			maleSelected = true
			femaleSelected = false
		}
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
		scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.contentView.frame.height)
		scrollView.frame = CGRect(x: 0, y: 24, width: self.view.frame.width, height: (self.view.frame.height - tabHeight) - 24)
	}

	fileprivate func addViews() {
		view.addSubview(scrollView)
		view.addSubview(topView)
		scrollView.addSubview(contentView)
		contentView.addSubview(macrosView)
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		topView.translatesAutoresizingMaskIntoConstraints = false
		contentView.translatesAutoresizingMaskIntoConstraints = false
		macrosView.translatesAutoresizingMaskIntoConstraints = false
		
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
		
		macrosView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 32).isActive = true
		macrosView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32).isActive = true
		macrosView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32).isActive = true
		macrosView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
	}
	
}
