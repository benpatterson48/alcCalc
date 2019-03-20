//
//  ResultsVC.swift
//  alcCalc
//
//  Created by Ben Patterson on 3/11/19.
//  Copyright © 2019 Ben Patterson. All rights reserved.
//

import UIKit

class ResultsVC: UIViewController {
    
    var calories: Double?
    var fatsSelected: Bool = true
    var carsbSelected: Bool = false
    var roundedSelected: Bool = true
    var outputSelected: String = "Fats"
    
    func initData(caloriesSent: Double) {
        self.calories = caloriesSent
        caloriesLbl.text = "Cals: \(calories!)"
    }
    
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let closeBtn: UIButton = {
        let close = UIButton()
        close.setImage(UIImage(named: "close"), for: .normal)
        close.addTarget(self, action: #selector(closeBtnWasPressed), for: .touchUpInside)
        close.translatesAutoresizingMaskIntoConstraints = false
        return close
    }()
    
    @objc func closeBtnWasPressed() {
        print("button tapped recognized")
        dismissResultsVC()
    }
    
    private let topViewBG: UIView = {
        let bg = UIView()
        bg.backgroundColor = #colorLiteral(red: 0, green: 0.7743021846, blue: 0.8264589906, alpha: 1)
        bg.translatesAutoresizingMaskIntoConstraints = false
        return bg
    }()
    
    private let topViewTitleLbl: UILabel = {
        let title = UILabel()
        title.text = "RESULTS"
        title.textColor = .white
        title.textAlignment = .center
        title.font = UIFont.mainSemiBoldFont(ofSize: 28)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let caloriesLbl: UILabel = {
        let calories = UILabel()
        calories.textAlignment = .center
        calories.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        calories.font = UIFont.mainMediumFont(ofSize: 18)
        calories.translatesAutoresizingMaskIntoConstraints = false
        return calories
    }()
    
    private let fatsTitleLbl: UIButton = {
        let title = UIButton()
        title.setTitle("Fats", for: .normal)
        title.backgroundColor = #colorLiteral(red: 1, green: 0.3647058824, blue: 0.3647058824, alpha: 1)
        title.layer.cornerRadius = 5
        title.titleLabel?.font = UIFont.mainMediumFont(ofSize: 16)
        title.addTarget(self, action: #selector(outputPreferenceWasChanged), for: .touchUpInside)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let carbsTitleLbl: UIButton = {
        let title = UIButton()
        title.setTitle("Carbs", for: .normal)
        title.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        title.layer.cornerRadius = 5
        title.titleLabel?.font = UIFont.mainMediumFont(ofSize: 16)
        title.titleLabel?.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.5)
        title.addTarget(self, action: #selector(outputPreferenceWasChanged), for: .touchUpInside)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    @objc func outputPreferenceWasChanged() {
        if fatsSelected == true {
            carsbSelected = true
            fatsSelected = false
            outputSelected = "Carbs"
            sliderValueChanging(outputResultsSlider)
            carbsTitleLbl.backgroundColor = #colorLiteral(red: 1, green: 0.3647058824, blue: 0.3647058824, alpha: 1)
            carbsTitleLbl.titleLabel?.textColor = .white
            fatsTitleLbl.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            fatsTitleLbl.titleLabel?.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.5)
        } else {
            carsbSelected = false
            fatsSelected = true
            outputSelected = "Fats"
            sliderValueChanging(outputResultsSlider)
            fatsTitleLbl.backgroundColor = #colorLiteral(red: 1, green: 0.3647058824, blue: 0.3647058824, alpha: 1)
            fatsTitleLbl.titleLabel?.textColor = .white
            carbsTitleLbl.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            carbsTitleLbl.titleLabel?.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.5)
        }
    }
    
    private let fatsOutputLbl: UILabel = {
        let output = UILabel()
        output.text = "0g"
        output.textAlignment = .center
        output.textColor = #colorLiteral(red: 1, green: 0.3647058824, blue: 0.3647058824, alpha: 1)
        output.font = UIFont.mainSemiBoldFont(ofSize: 50)
        output.translatesAutoresizingMaskIntoConstraints = false
        return output
    }()
    
    private let carbsOutputLbl: UILabel = {
        let output = UILabel()
        output.text = "0g"
        output.textAlignment = .center
        output.textColor = #colorLiteral(red: 1, green: 0.3647058824, blue: 0.3647058824, alpha: 1)
        output.font = UIFont.mainSemiBoldFont(ofSize: 50)
        output.translatesAutoresizingMaskIntoConstraints = false
        return output
    }()
    
    private let outputResultsSlider: UISlider = {
        let slider = UISlider()
        slider.tintColor = #colorLiteral(red: 0.1725490196, green: 0.7607843137, blue: 0.8156862745, alpha: 1)
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.isContinuous = true
        slider.addTarget(self, action: #selector(sliderValueChanging(_:)), for: .valueChanged)
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    private let fatsLbl: UILabel = {
        let title = UILabel()
        title.text = "Fats"
        title.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.2975973887)
        title.textAlignment = .center
        title.font = UIFont.mainFont(ofSize: 12)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let carbsLbl: UILabel = {
        let title = UILabel()
        title.text = "Carbs"
        title.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.2975973887)
        title.textAlignment = .center
        title.font = UIFont.mainFont(ofSize: 12)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let roundedOptionBtn: UIButton = {
        let button = UIButton()
        button.setTitle("Rounded", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.1725490196, green: 0.7607843137, blue: 0.8156862745, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.mainSemiBoldFont(ofSize: 18)
        button.addTarget(self, action: #selector(roundedOrDecimalOptionWasChanged), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let decimalOptionBtn: UIButton = {
        let button = UIButton()
        button.setTitle("Decimal", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.mainFont(ofSize: 18)
        button.addTarget(self, action: #selector(roundedOrDecimalOptionWasChanged), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func roundedOrDecimalOptionWasChanged() {
        if roundedSelected == true {
            roundedSelected = false
            roundedOptionBtn.setTitleColor(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), for: .normal)
            roundedOptionBtn.titleLabel?.font = UIFont.mainFont(ofSize: 18)
            decimalOptionBtn.setTitleColor(#colorLiteral(red: 0.1725490196, green: 0.7607843137, blue: 0.8156862745, alpha: 1), for: .normal)
            decimalOptionBtn.titleLabel?.font = UIFont.mainSemiBoldFont(ofSize: 18)
            sliderValueChanging(outputResultsSlider)
        } else {
            roundedSelected = true
            decimalOptionBtn.setTitleColor(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), for: .normal)
            decimalOptionBtn.titleLabel?.font = UIFont.mainFont(ofSize: 18)
            roundedOptionBtn.setTitleColor(#colorLiteral(red: 0.1725490196, green: 0.7607843137, blue: 0.8156862745, alpha: 1), for: .normal)
            roundedOptionBtn.titleLabel?.font = UIFont.mainSemiBoldFont(ofSize: 18)
            sliderValueChanging(outputResultsSlider)
        }
    }
    
    @objc func sliderValueChanging(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        let remainderValue = 100 - currentValue
        sliderOutputValuePercentageLbl.text = "\(currentValue)% \(outputSelected)"
        if fatsSelected == true {
            fatsOutputLbl.text = "\(calculateMacros(calories: self.calories!, value: currentValue, gramsConversion: 9))g"
            carbsOutputLbl.text = "\(calculateMacros(calories: self.calories!, value: remainderValue, gramsConversion: 4))g"
        } else {
            fatsOutputLbl.text = "\(calculateMacros(calories: self.calories!, value: remainderValue, gramsConversion: 9))g"
            carbsOutputLbl.text = "\(calculateMacros(calories: self.calories!, value: currentValue, gramsConversion: 4))g"
        }
    }
    
    func calculateMacros(calories:
        Double, value: Int, gramsConversion: Double) -> Double {
        if value == 100 {
            let remainder = Double(value) * 0.01
            let calories = remainder * calories
            let macrosDecimals = calories / gramsConversion
            if roundedSelected == true {
                let macros = macrosDecimals.rounded(digits: 0)
                return macros
            } else {
                let macros = macrosDecimals.rounded(digits: 1)
                return macros
            }
        } else {
            let wholeRemainder: Double = Double(value % 100)
            let remainder = wholeRemainder * 0.01
            let calories = remainder * calories
            let macrosDecimals = calories / gramsConversion
            if roundedSelected == true {
                let macros = macrosDecimals.rounded(digits: 0)
                return macros
            } else {
                let macros = macrosDecimals.rounded(digits: 1)
                return macros
            }
        }
    }

    private let sliderOutputValuePercentageLbl: UILabel = {
        let result = UILabel()
        result.text = "0% Fats"
        result.textAlignment = .right
        result.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        result.font = UIFont.mainMediumFont(ofSize: 18)
        result.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.clear
        view.isOpaque = false
        setupContentViewAndConstraints()
    }
    
    @objc func dismissResultsVC() {
        print("dismiss called")
        dismiss(animated: true, completion: nil)
    }
    
    func setupContentViewAndConstraints() {
        view.addSubview(contentView)
        view.addSubview(closeBtn)
        contentView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -24).isActive = true
        
        closeBtn.bottomAnchor.constraint(equalTo: contentView.topAnchor, constant: -8).isActive = true
        closeBtn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        closeBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        closeBtn.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        setupBGViewAndLabels()
    }
    
    func setupBGViewAndLabels() {
        contentView.addSubview(topViewBG)
        topViewBG.addSubview(topViewTitleLbl)
        contentView.addSubview(caloriesLbl)
        contentView.addSubview(sliderOutputValuePercentageLbl)
        
        topViewBG.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        topViewBG.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        topViewBG.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        topViewBG.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        topViewTitleLbl.centerXAnchor.constraint(equalTo: topViewBG.centerXAnchor).isActive = true
        topViewTitleLbl.centerYAnchor.constraint(equalTo: topViewBG.centerYAnchor).isActive = true
        
        caloriesLbl.topAnchor.constraint(equalTo: topViewBG.bottomAnchor, constant: 24).isActive = true
        caloriesLbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24).isActive = true
        
        sliderOutputValuePercentageLbl.topAnchor.constraint(equalTo: topViewBG.bottomAnchor, constant: 24).isActive = true
        sliderOutputValuePercentageLbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24).isActive = true
        
        setupFatsAndCarbsStackView()
    }
    
    func setupFatsAndCarbsStackView() {
        let fatsStackView = UIStackView(arrangedSubviews: [fatsTitleLbl, fatsOutputLbl, fatsLbl])
        fatsStackView.translatesAutoresizingMaskIntoConstraints = false
        fatsStackView.axis = .vertical
        fatsStackView.spacing = 0
        fatsStackView.distribution = .fillProportionally
        fatsTitleLbl.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        let carbsStackView = UIStackView(arrangedSubviews: [carbsTitleLbl, carbsOutputLbl, carbsLbl])
        carbsStackView.translatesAutoresizingMaskIntoConstraints = false
        carbsStackView.axis = .vertical
        carbsStackView.spacing = 0
        carbsStackView.distribution = .fillProportionally
        carbsTitleLbl.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        let combinedOutputStackView = UIStackView(arrangedSubviews: [fatsStackView, carbsStackView])
        contentView.addSubview(combinedOutputStackView)

        combinedOutputStackView.translatesAutoresizingMaskIntoConstraints = false
        combinedOutputStackView.axis = .horizontal
        combinedOutputStackView.distribution = .fillEqually
        combinedOutputStackView.alignment = .fill
        combinedOutputStackView.spacing = 15
        
        combinedOutputStackView.topAnchor.constraint(equalTo: caloriesLbl.bottomAnchor, constant: 24).isActive = true
        combinedOutputStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24).isActive = true
        combinedOutputStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24).isActive = true
        
        contentView.addSubview(outputResultsSlider)
        outputResultsSlider.topAnchor.constraint(equalTo: combinedOutputStackView.bottomAnchor, constant: 24).isActive = true
        outputResultsSlider.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24).isActive = true
        outputResultsSlider.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24).isActive = true
        
        setupRoundedOrDecimalOptionBtnStackView()
    }
    
    func setupRoundedOrDecimalOptionBtnStackView() {
        let optionsStackView = UIStackView(arrangedSubviews: [roundedOptionBtn, decimalOptionBtn])
        optionsStackView.axis = .horizontal
        optionsStackView.spacing = 15
        optionsStackView.distribution = .fillEqually
        optionsStackView.alignment = .fill

        contentView.addSubview(optionsStackView)
        optionsStackView.translatesAutoresizingMaskIntoConstraints = false
        optionsStackView.topAnchor.constraint(equalTo: outputResultsSlider.bottomAnchor, constant: 24).isActive = true
        optionsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24).isActive = true
        optionsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24).isActive = true
        roundedOptionBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        decimalOptionBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    
}
