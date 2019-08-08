//
//  AlcoholMethodView.swift
//  alcCalc
//
//  Created by Ben Patterson on 8/8/19.
//  Copyright © 2019 Ben Patterson. All rights reserved.
//

import UIKit

class CalorieMethodView: UIView {
	
	let caloriesTitle = TitleWithInfoButton(titleText: "Enter Beverage Calories")
	let abvPercentTitle = TitleWithInfoButton(titleText: "Enter Ounces and ABV %")
	
	let caloriesInputView = CustomTextFieldView(font: UIFont.systemFont(ofSize: 100, weight: .medium), placeholder: "0 cals")
	let ouncesInputView = CustomTextFieldView(font: UIFont.systemFont(ofSize: 20, weight: .medium), placeholder: "oz")
	let abvPercentInputView = CustomTextFieldView(font: UIFont.systemFont(ofSize: 20, weight: .medium), placeholder: "%")
	
	
}
