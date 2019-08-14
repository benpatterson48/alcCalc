//
//  AlcoholResultsView.swift
//  alcCalc
//
//  Created by Ben Patterson on 8/13/19.
//  Copyright © 2019 Ben Patterson. All rights reserved.
//

import UIKit

class AlcoholResultsView: UIView {
	
	let titleLabel: UILabel = {
		let title = UILabel()
		title.text = "Results"
		title.textAlignment = .left
		title.textColor = UIColor.Main.text
		title.font = UIFont.boldSystemFont(ofSize: 30)
		title.translatesAutoresizingMaskIntoConstraints = false
		return title
	}()
	
	let inputsLabel: UILabel = {
		let calories = UILabel()
		calories.numberOfLines = 0
		calories.textAlignment = .left
		calories.textColor = UIColor.Main.text
		calories.font = UIFont.systemFont(ofSize: 18)
		calories.translatesAutoresizingMaskIntoConstraints = false
		return calories
	}()
	
	let sliderPercentValueLabel: UILabel = {
		let result = UILabel()
		result.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
		result.text = "0% Fats"
		result.textAlignment = .right
		result.font = UIFont.systemFont(ofSize: 18)
		result.translatesAutoresizingMaskIntoConstraints = false
		return result
	}()
	
	let fatButton: UIButton = {
		let button = UIButton()
		button.setTitle("Fats", for: .normal)
		button.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
		button.layer.cornerRadius = 5
		button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
		button.translatesAutoresizingMaskIntoConstraints = false
		button.heightAnchor.constraint(equalToConstant: 35).isActive = true
		return button
	}()
	
	let carbButton: UIButton = {
		let button = UIButton()
		button.setTitle("Carbs", for: .normal)
		button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
		button.layer.cornerRadius = 5
		button.titleLabel?.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.5)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
		button.translatesAutoresizingMaskIntoConstraints = false
		button.heightAnchor.constraint(equalToConstant: 35).isActive = true
		return button
	}()
	
	let fatResultsLabel: UILabel = {
		let output = UILabel()
		output.textColor = #colorLiteral(red: 0.1725490196, green: 0.1725490196, blue: 0.1725490196, alpha: 1)
		output.textAlignment = .center
		output.adjustsFontSizeToFitWidth = true
		output.font = UIFont.boldSystemFont(ofSize: 48)
		output.translatesAutoresizingMaskIntoConstraints = false
		return output
	}()
	
	let cabResultsLabel: UILabel = {
		let output = UILabel()
		output.textColor = #colorLiteral(red: 0.1725490196, green: 0.1725490196, blue: 0.1725490196, alpha: 1)
		output.textAlignment = .center
		output.adjustsFontSizeToFitWidth = true
		output.font = UIFont.boldSystemFont(ofSize: 48)
		output.translatesAutoresizingMaskIntoConstraints = false
		return output
	}()
	
	let slider: UISlider = {
		let slider = UISlider()
		slider.tintColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
		slider.minimumValue = 0
		slider.maximumValue = 100
		slider.isContinuous = true
		slider.translatesAutoresizingMaskIntoConstraints = false
		return slider
	}()
	
	let roundedButton: UIButton = {
		let button = UIButton()
		button.setTitleColor(#colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1), for: .normal)
		button.setTitle("Rounded", for: .normal)
		button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	let decimalButton: UIButton = {
		let button = UIButton()
		button.setTitleColor(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), for: .normal)
		button.setTitle("Decimal", for: .normal)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	let closeButton: UIButton = {
		let close = UIButton()
		close.contentMode = .scaleAspectFill
		close.setImage(UIImage(named: "close"), for: .normal)
		close.translatesAutoresizingMaskIntoConstraints = false
		close.widthAnchor.constraint(equalToConstant: 25).isActive = true
		close.heightAnchor.constraint(equalToConstant: 25).isActive = true
		return close
	}()
	
	lazy var macroSelectionButtons = HorizontalStack(arrangedSubviews: [self.fatButton, self.carbButton])
	lazy var macroOutputsStack = HorizontalStack(arrangedSubviews: [self.fatResultsLabel, self.cabResultsLabel])
	lazy var outputDecimalTypeStack = HorizontalStack(arrangedSubviews: [self.roundedButton, self.decimalButton])
	lazy var inputsAndSliderValueStack = HorizontalStack(arrangedSubviews: [self.inputsLabel, self.sliderPercentValueLabel])
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = .white
		layer.cornerRadius = 15
		addViews()
	}
	
	func addViews() {
		addSubview(titleLabel)
		titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 32).isActive = true
		titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
		
		addSubview(closeButton)
		closeButton.topAnchor.constraint(equalTo: titleLabel.topAnchor).isActive = true
		closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
		
		let contentStack = UIStackView(arrangedSubviews: [inputsAndSliderValueStack, macroSelectionButtons, macroOutputsStack, slider, outputDecimalTypeStack])
		addSubview(contentStack)
		contentStack.translatesAutoresizingMaskIntoConstraints = false
		contentStack.axis = .vertical
		contentStack.distribution = .fillProportionally
		contentStack.spacing = 45
		
		contentStack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24).isActive = true
		contentStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
		contentStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
		contentStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32).isActive = true
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
}
