//
//  MacrosContentView.swift
//  alcCalc
//
//  Created by Ben Patterson on 8/6/19.
//  Copyright © 2019 Ben Patterson. All rights reserved.
//

import UIKit

class MacrosContentView: UIView {
	
	let ageTitle = TitleWithInfoButton(titleText: "Age")
	let weightTitle = TitleWithInfoButton(titleText: "Weight")
	let heightTitle = TitleWithInfoButton(titleText: "Height")
	let genderTitle = TitleWithInfoButton(titleText: "Gender")
	let activityTitle = TitleWithInfoButton(titleText: "Activity Level")
	
	let activityCollectionView = ActivityLevelCollectionView(frame: .zero, collectionViewLayout: .init())
	
	let ageInputView = CustomTextFieldView(font: UIFont.systemFont(ofSize: 18), placeholder: "yrs")
	let weightInputView = CustomTextFieldView(font: UIFont.systemFont(ofSize: 18), placeholder: "lbs")
	let heightFeetInputView = CustomTextFieldView(font: UIFont.systemFont(ofSize: 18), placeholder: "ft")
	let heightInchesInputView = CustomTextFieldView(font: UIFont.systemFont(ofSize: 18), placeholder: "in")
	
	let calculateButton = CalculateButton()
	
	let title: UILabel = {
		let title = UILabel()
		title.text = "Estimate Macros"
		title.textColor = UIColor.Main.text
		title.textAlignment = .left
		title.adjustsFontSizeToFitWidth = true
		title.font = UIFont.boldSystemFont(ofSize: 30)
		title.translatesAutoresizingMaskIntoConstraints = false
		return title
	}()
	
	let infoButton: UIButton = {
		let info = UIButton()
		info.contentMode = .scaleAspectFit
		info.translatesAutoresizingMaskIntoConstraints = false
		info.setBackgroundImage(UIImage(named: "info"), for: .normal)
		info.widthAnchor.constraint(equalToConstant: 25).isActive = true
		info.heightAnchor.constraint(equalToConstant: 25).isActive = true
		return info
	}()
	
	let genderSwitch: UISegmentedControl = {
		let items = ["Male", "Female"]
		let segment = UISegmentedControl(items: items)
		segment.selectedSegmentIndex = 0
		segment.layer.cornerRadius = 10
		segment.backgroundColor = .white
		segment.tintColor = UIColor.Main.blue
		segment.heightAnchor.constraint(equalToConstant: 30).isActive = true 
		segment.setTitleTextAttributes([NSAttributedString.Key.strokeColor: UIColor(red: 51, green: 51, blue: 51, alpha: 100)], for: UIControl.State.normal)
		segment.translatesAutoresizingMaskIntoConstraints = false
		return segment
	}()
	
	lazy var titleStackView: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [self.title, self.infoButton])
		stack.axis = .horizontal
		stack.distribution = .fillProportionally
		stack.translatesAutoresizingMaskIntoConstraints = false
		return stack
	}()
	
	lazy var heightStack: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [self.heightFeetInputView, self.heightInchesInputView])
		stack.axis = .horizontal
		stack.distribution = .fillEqually
		stack.spacing = 10
		stack.translatesAutoresizingMaskIntoConstraints = false
		return stack
	}()
	
	lazy var genderStackView: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [self.genderTitle, self.genderSwitch])
		stack.axis = .vertical
		stack.spacing = 25
		stack.distribution = .fillProportionally
		stack.translatesAutoresizingMaskIntoConstraints = false
		return stack
	}()
	
	lazy var heightStackView: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [self.heightTitle, self.heightStack])
		stack.axis = .vertical
		stack.spacing = 25
		stack.distribution = .fillProportionally
		stack.translatesAutoresizingMaskIntoConstraints = false
		return stack
	}()
	
	lazy var ageStackView: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [self.ageTitle, self.ageInputView])
		stack.axis = .vertical
		stack.spacing = 25
		stack.distribution = .fillProportionally
		stack.translatesAutoresizingMaskIntoConstraints = false
		return stack
	}()
	
	lazy var heightAgeHorizontalStack: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [self.heightStackView, self.ageStackView])
		stack.distribution = .fillProportionally
		stack.spacing = 30
		stack.translatesAutoresizingMaskIntoConstraints = false
		return stack
	}()
	
	lazy var weightStackView: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [self.weightTitle, self.weightInputView])
		stack.axis = .vertical
		stack.spacing = 25
		stack.distribution = .fillProportionally
		stack.translatesAutoresizingMaskIntoConstraints = false
		return stack
	}()
	
	lazy var activityStackView: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [self.activityTitle, self.activityCollectionView])
		stack.axis = .vertical
		stack.spacing = 25
		stack.distribution = .fillProportionally
		stack.translatesAutoresizingMaskIntoConstraints = false
		return stack
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		createMajorStackView()
		setupCollectionView()
		self.activityTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
		calculateButton.titleLabel?.attributedText = calculateButton.titleLabel?.text?.increaseLetterSpacing()
	}
	
	func setupCollectionView() {
		self.activityCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -32).isActive = true
		self.activityCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 32).isActive = true
		self.activityCollectionView.heightAnchor.constraint(equalToConstant: 125).isActive = true
		self.activityCollectionView.backgroundColor = .white
		
		self.activityCollectionView.contentInset.left = 32
		self.activityCollectionView.contentInset.right = 16
	}
	
	func createMajorStackView() {
		let majorStackView = UIStackView(arrangedSubviews: [titleStackView, genderStackView, heightAgeHorizontalStack, weightStackView, activityStackView, calculateButton])
		majorStackView.translatesAutoresizingMaskIntoConstraints = false
		majorStackView.axis = .vertical
		majorStackView.distribution = .fillProportionally
		majorStackView.alignment = .fill
		majorStackView.spacing = 40
		
		addSubview(majorStackView)
		majorStackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
		majorStackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
		majorStackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
		majorStackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
