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
    var outputSelected: String = "Fats"
    
    func initData(caloriesSent: Double) {
        self.calories = caloriesSent
        caloriesLbl.text = "Calories: \(calories!)"
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
        calories.font = UIFont.mainMediumFont(ofSize: 20)
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
        output.textAlignment = .left
        output.textColor = #colorLiteral(red: 1, green: 0.3647058824, blue: 0.3647058824, alpha: 1)
        output.font = UIFont.mainSemiBoldFont(ofSize: 50)
        output.translatesAutoresizingMaskIntoConstraints = false
        return output
    }()
    
    private let carbsOutputLbl: UILabel = {
        let output = UILabel()
        output.text = "0g"
        output.textAlignment = .right
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
        let wholeRemainder: Double = Double(value % 100)
        let remainder = wholeRemainder * 0.01
        let calories = remainder * calories
        let macrosDecimals = calories / gramsConversion
        let macros = macrosDecimals.rounded(digits: 1)
        return macros
    }

    private let sliderOutputValuePercentageLbl: UILabel = {
        let result = UILabel()
        result.text = "0% Fats"
        result.textAlignment = .right
        result.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        result.font = UIFont.mainSemiBoldFont(ofSize: 16)
        result.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.7)
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
        
        topViewBG.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        topViewBG.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        topViewBG.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        topViewBG.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        topViewTitleLbl.centerXAnchor.constraint(equalTo: topViewBG.centerXAnchor).isActive = true
        topViewTitleLbl.centerYAnchor.constraint(equalTo: topViewBG.centerYAnchor).isActive = true
        
        caloriesLbl.topAnchor.constraint(equalTo: topViewBG.bottomAnchor, constant: 24).isActive = true
        caloriesLbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24).isActive = true
        caloriesLbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24).isActive = true
        
        setupFatsAndCarbsStackView()
    }
    
    func setupFatsAndCarbsStackView() {
        let fatsStackView = UIStackView(arrangedSubviews: [fatsTitleLbl, fatsOutputLbl])
        fatsStackView.translatesAutoresizingMaskIntoConstraints = false
        fatsStackView.axis = .vertical
        fatsStackView.spacing = 5
        fatsStackView.distribution = .fillProportionally
        fatsTitleLbl.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        let carbsStackView = UIStackView(arrangedSubviews: [carbsTitleLbl, carbsOutputLbl])
        carbsStackView.translatesAutoresizingMaskIntoConstraints = false
        carbsStackView.axis = .vertical
        carbsStackView.spacing = 5
        carbsStackView.distribution = .fillProportionally
        carbsTitleLbl.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        let combinedOutputStackView = UIStackView(arrangedSubviews: [fatsStackView, carbsStackView])
        contentView.addSubview(combinedOutputStackView)

        combinedOutputStackView.translatesAutoresizingMaskIntoConstraints = false
        combinedOutputStackView.axis = .horizontal
        combinedOutputStackView.distribution = .fillEqually
        combinedOutputStackView.alignment = .fill
        combinedOutputStackView.spacing = 20
        
        combinedOutputStackView.topAnchor.constraint(equalTo: caloriesLbl.bottomAnchor, constant: 24).isActive = true
        combinedOutputStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32).isActive = true
        combinedOutputStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32).isActive = true
        
        contentView.addSubview(outputResultsSlider)
        outputResultsSlider.topAnchor.constraint(equalTo: combinedOutputStackView.bottomAnchor, constant: 24).isActive = true
        
        setupSliderAndBottomLabels()
    }
    
    func setupSliderAndBottomLabels() {
        contentView.addSubview(sliderOutputValuePercentageLbl)
        outputResultsSlider.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32).isActive = true
        outputResultsSlider.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32).isActive = true
        
        sliderOutputValuePercentageLbl.trailingAnchor.constraint(equalTo: outputResultsSlider.trailingAnchor).isActive = true
        sliderOutputValuePercentageLbl.topAnchor.constraint(equalTo: outputResultsSlider.bottomAnchor, constant: 12).isActive = true
    }

}
