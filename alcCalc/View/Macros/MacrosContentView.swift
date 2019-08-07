//
//  MacrosContentView.swift
//  alcCalc
//
//  Created by Ben Patterson on 8/6/19.
//  Copyright © 2019 Ben Patterson. All rights reserved.
//

import UIKit

class MacrosContentView: UIView {
	
	let ageTitle = TitleWithInfoBtnAndIcon(iconImage: "age", titleText: "Age")
	let heightTitle = TitleWithInfoBtnAndIcon(iconImage: "height", titleText: "Height")
	let genderTitle = TitleWithInfoBtnAndIcon(iconImage: "geneder", titleText: "Gender")
	let activityTitle = TitleWithInfoBtnAndIcon(iconImage: "activity", titleText: "Activity Level")
	
	let ageInputView = CustomTextFieldView(font: UIFont.systemFont(ofSize: 18), placeholder: "yrs")
	let heightFeetInputView = CustomTextFieldView(font: UIFont.systemFont(ofSize: 18), placeholder: "ft")
	let heightInchesInputView = CustomTextFieldView(font: UIFont.systemFont(ofSize: 18), placeholder: "in")
	let weightInputView = CustomTextFieldView(font: UIFont.systemFont(ofSize: 18), placeholder: "lbs")
	
	let title: UILabel = {
		let title = UILabel()
		title.textColor = UIColor.Main.text
		title.textAlignment = .left
		title.font = UIFont.boldSystemFont(ofSize: 32)
		title.translatesAutoresizingMaskIntoConstraints = false
		return title
	}()
	
	let genderSwitch: UISegmentedControl = {
		let items = ["Male", "Female"]
		let segment = UISegmentedControl(items: items)
		segment.selectedSegmentIndex = 0
		segment.layer.cornerRadius = 10
		segment.backgroundColor = .white
		segment.tintColor = UIColor.Main.blue
		segment.setTitleTextAttributes([NSAttributedString.Key.strokeColor: UIColor(red: 51, green: 51, blue: 51, alpha: 100)], for: UIControl.State.normal)
		segment.translatesAutoresizingMaskIntoConstraints = false
		return segment
	}()
	
}
