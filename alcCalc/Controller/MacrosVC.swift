//
//  MacrosVC.swift
//  alcCalc
//
//  Created by Ben Patterson on 5/13/19.
//  Copyright © 2019 Ben Patterson. All rights reserved.
//

import UIKit

class MacrosVC: UIViewController {
    
    let calc = Calculations.instance
    
    let surplusButton = WordButtons()
    let deficitButton = WordButtons()
    let lowEndButton = WordOptions()
    let moderateButton = WordOptions()
    let highEndButton = WordOptions()
    
    var weight: Int?
    var protein: Int?
    var carb: Int?
    var fat: Int?
    var maintenanceCals: Int?
    var goalCals: Int?
    var bodyGoal: Int?
    var bodyGoalSpeed: Int?
    var surplusSelected: Bool = true
    var moderateSelected: Bool = true
    var lowEndSelected: Bool = false
    var highEndSelected: Bool = false
    
    private let topViewHeaderBg: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0, green: 0.6745098039, blue: 0.9294117647, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let topViewHeaderTitleLbl: UILabel = {
        let title = UILabel()
        title.textColor = .white
        title.textAlignment = .center
        title.font = UIFont.mainSemiBoldFont(ofSize: 26)
        title.text = "Estimate Macros"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let macroTitleLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Your Estimated Macros"
        lbl.textAlignment = .center
        lbl.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.75)
        lbl.font = UIFont.mainSemiBoldFont(ofSize: 20)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let macroTextLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "These macros are a great starting point on your fitness journey, but remember, don't be scared to experiment with carbs and fats to find the right balance for you."
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.6)
        lbl.font = UIFont.mainFont(ofSize: 14)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let calculateBtn: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.backgroundColor = #colorLiteral(red: 0, green: 0.6745098039, blue: 0.9294117647, alpha: 1)
        button.setTitle("CALCULATE", for: .normal)
        button.titleLabel?.font = UIFont.mainSemiBoldFont(ofSize: 22)
        button.addTarget(self, action: #selector(calcBtnWasPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func calcBtnWasPressed() {
        let weight = Int( weightInputTextField.text!) ?? 0
        self.maintenanceCals = calc.calcMaintenanceCals(weight: weight, goalSpeed: bodyGoalSpeed ?? 0)
        self.goalCals = calc.calcGoalCals(maintenanceCals: maintenanceCals ?? 0, bodyCompGoal: bodyGoal ?? 0)
        self.protein = calc.calcProtein(weight: weight)
        self.fat = calc.calcFats(goalCals: goalCals ?? 0)
        self.carb = calc.calcCarbs(protein: protein ?? 0, fats: fat ?? 0, maintenanceCals: maintenanceCals ?? 0)
        transitionToResults()
    }
    
    func transitionToResults() {
        let resultsVC = MacroResultsVC()
        resultsVC.initData(maintenanceResults: maintenanceCals!, goalResults: goalCals!, proteinResults: protein!, carbResults: carb!, fatResults: fat!)
        resultsVC.modalPresentationStyle = .custom
        weightInputTextField.text = ""
        view.endEditing(true)
        present(resultsVC, animated: true, completion: nil)
    }
    
    private let weightTitle: UILabel = {
        let weightTitle = UILabel()
        weightTitle.text = "Enter Weight:"
        weightTitle.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.75)
        weightTitle.font = UIFont.mainSemiBoldFont(ofSize: 18)
        weightTitle.translatesAutoresizingMaskIntoConstraints = false
        return weightTitle
    }()
    
    private let weightInputTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.8)
        textField.keyboardType = .numberPad
        textField.font = UIFont.boldSystemFont(ofSize: 32)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let inputFieldUnderLineView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupButtons()
        addViews()
        changeByDevice()
        addButtonActions()
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func addButtonActions() {
        surplusButton.addTarget(self, action: #selector(surplusButtonWasPressed), for: .touchUpInside)
        deficitButton.addTarget(self, action: #selector(deficitButtonWasPressed), for: .touchUpInside)
        lowEndButton.addTarget(self, action: #selector(lowEndButtonWasPressed), for: .touchUpInside)
        moderateButton.addTarget(self, action: #selector(moderateButtonWasPressed), for: .touchUpInside)
        highEndButton.addTarget(self, action: #selector(highEndButtonWasPressed), for: .touchUpInside)
    }
    
    @objc func surplusButtonWasPressed() {
        bodyGoal = 350
        surplusButton.backgroundColor = #colorLiteral(red: 0, green: 0.6745098039, blue: 0.9294117647, alpha: 1)
        surplusButton.setTitleColor(.white, for: .normal)
        deficitButton.setTitleColor(#colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1), for: .normal)
        deficitButton.backgroundColor = .white
    }
    
    @objc func deficitButtonWasPressed() {
        bodyGoal = -500
        deficitButton.setTitleColor(.white, for: .normal)
        deficitButton.backgroundColor = #colorLiteral(red: 0, green: 0.6745098039, blue: 0.9294117647, alpha: 1)
        surplusButton.setTitleColor(#colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1), for: .normal)
        surplusButton.backgroundColor = .white
    }
    
    @objc func lowEndButtonWasPressed() {
        bodyGoalSpeed = 12
        lowEndButton.setTitleColor(#colorLiteral(red: 0, green: 0.6745098039, blue: 0.9294117647, alpha: 1), for: .normal)
        moderateButton.setTitleColor(#colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1), for: .normal)
        highEndButton.setTitleColor(#colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1), for: .normal)
    }
    
    @objc func highEndButtonWasPressed() {
        bodyGoalSpeed = 16
        highEndButton.setTitleColor(#colorLiteral(red: 0, green: 0.6745098039, blue: 0.9294117647, alpha: 1), for: .normal)
        lowEndButton.setTitleColor(#colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1), for: .normal)
        moderateButton.setTitleColor(#colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1), for: .normal)
    }
    
    @objc func moderateButtonWasPressed() {
        bodyGoalSpeed = 14
        moderateButton.setTitleColor(#colorLiteral(red: 0, green: 0.6745098039, blue: 0.9294117647, alpha: 1), for: .normal)
        lowEndButton.setTitleColor(#colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1), for: .normal)
        highEndButton.setTitleColor(#colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1), for: .normal)
    }
    
    func setupButtons() {
        surplusButton.setTitle("SURPLUS", for: .normal)
        deficitButton.setTitle("DEFICIT", for: .normal)
        lowEndButton.setTitle("LOW-END", for: .normal)
        lowEndButton.contentHorizontalAlignment = .left
        moderateButton.setTitle("MODERATE", for: .normal)
        highEndButton.setTitle("HIGH-END", for: .normal)
        highEndButton.contentHorizontalAlignment = .right
        
        if surplusSelected == true {
            surplusButtonWasPressed()
        } else {
            deficitButtonWasPressed()
        }
        if moderateSelected == true {
            moderateButtonWasPressed()
        } else if lowEndSelected == true {
            lowEndButtonWasPressed()
        } else if highEndSelected == true {
            highEndButtonWasPressed()
        }
    }
    
    func changeByDevice() {
        if UIDevice.current.name == "iPhone 5s" || UIDevice.current.name == "iPhone SE" {
            topViewHeaderBg.heightAnchor.constraint(equalToConstant: 85).isActive = true
        } else if UIDevice.current.name == "iPhone 6" || UIDevice.current.name == "iPhone 7" || UIDevice.current.name == "iPhone 8" {
            topViewHeaderBg.heightAnchor.constraint(equalToConstant: 85).isActive = true
        } else if UIDevice.current.name == "iPhone X" || UIDevice.current.name == "iPhone XR" || UIDevice.current.name == "iPhone XS" || UIDevice.current.name == "iPhone XS Max" {
            topViewHeaderBg.heightAnchor.constraint(equalToConstant: 110).isActive = true
        }
    }
    
    func addViews() {
        view.addSubview(topViewHeaderBg)
        topViewHeaderBg.addSubview(topViewHeaderTitleLbl)
        createTopBGHeaderConstraints()
    }
    
    func createTopBGHeaderConstraints() {
        topViewHeaderBg.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topViewHeaderBg.heightAnchor.constraint(equalToConstant: 110).isActive = true
        topViewHeaderBg.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topViewHeaderBg.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        topViewHeaderTitleLbl.bottomAnchor.constraint(equalTo: topViewHeaderBg.bottomAnchor, constant: -16).isActive = true
        topViewHeaderTitleLbl.centerXAnchor.constraint(equalTo: topViewHeaderBg.centerXAnchor).isActive = true
        
        createMacroExplanationStackView()
    }
    
    func createMacroExplanationStackView() {
        let macroStackView = UIStackView(arrangedSubviews: [macroTitleLbl, macroTextLbl])
        macroStackView.translatesAutoresizingMaskIntoConstraints = false
        macroStackView.axis = .vertical
        macroStackView.distribution = .fillProportionally
        macroStackView.spacing = 20
        
        view.addSubview(macroStackView)
        macroStackView.topAnchor.constraint(equalTo: topViewHeaderBg.bottomAnchor, constant: 32).isActive = true
        macroStackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 3/4).isActive = true
        macroStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        createStackViewsAndConstraints()
        
        if UIDevice.current.name == "iPhone 5s" || UIDevice.current.name == "iPhone SE" {
            macroStackView.spacing = 5
        } else if UIDevice.current.name == "iPhone 6" || UIDevice.current.name == "iPhone 7" || UIDevice.current.name == "iPhone 8" {
            macroStackView.spacing = 5
        } else if UIDevice.current.name == "iPhone X" || UIDevice.current.name == "iPhone XR" || UIDevice.current.name == "iPhone XS" || UIDevice.current.name == "iPhone XS Max" {
        }
    }
    
    func createStackViewsAndConstraints() {
        let weightStackView = UIStackView(arrangedSubviews: [weightTitle, weightInputTextField, inputFieldUnderLineView])
        weightStackView.translatesAutoresizingMaskIntoConstraints = false
        weightStackView.axis = .vertical
        weightStackView.distribution = .fillProportionally
        weightStackView.spacing = 5
        inputFieldUnderLineView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        inputFieldUnderLineView.widthAnchor.constraint(equalTo: weightStackView.widthAnchor, multiplier: 1/2).isActive = true
        
        let optionsStackView = UIStackView(arrangedSubviews: [surplusButton, deficitButton])
        optionsStackView.translatesAutoresizingMaskIntoConstraints = false
        optionsStackView.axis = .horizontal
        optionsStackView.distribution = .fillEqually
        optionsStackView.spacing = 20
        
        let macroRangeOptions = UIStackView(arrangedSubviews: [lowEndButton, moderateButton, highEndButton])
        macroRangeOptions.translatesAutoresizingMaskIntoConstraints = false
        macroRangeOptions.axis = .horizontal
        macroRangeOptions.distribution = .fillEqually
        
        let contentStackView = UIStackView(arrangedSubviews: [weightStackView, optionsStackView, macroRangeOptions, calculateBtn])
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.axis = .vertical
        contentStackView.distribution = .fillProportionally
        contentStackView.spacing = 65
        
        view.addSubview(contentStackView)
        contentStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 7/8).isActive = true
        contentStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        contentStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -12).isActive = true
        
        optionsStackView.leadingAnchor.constraint(equalTo: contentStackView.leadingAnchor, constant: 8).isActive = true
        optionsStackView.trailingAnchor.constraint(equalTo: contentStackView.trailingAnchor, constant: -8).isActive = true

        calculateBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        calculateBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        if UIDevice.current.name == "iPhone 5s" || UIDevice.current.name == "iPhone SE" {
            contentStackView.spacing = 15
            calculateBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
            calculateBtn.titleLabel?.font = UIFont.mainSemiBoldFont(ofSize: 18)
            macroTextLbl.font = UIFont.mainFont(ofSize: 14)
        } else if UIDevice.current.name == "iPhone 6" || UIDevice.current.name == "iPhone 7" || UIDevice.current.name == "iPhone 8" {
            contentStackView.spacing = 40
            calculateBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
            calculateBtn.titleLabel?.font = UIFont.mainSemiBoldFont(ofSize: 18)
            macroTextLbl.font = UIFont.mainFont(ofSize: 14)
        } else if UIDevice.current.name == "iPhone X" || UIDevice.current.name == "iPhone XR" || UIDevice.current.name == "iPhone XS" || UIDevice.current.name == "iPhone XS Max" {
        }
    }


}
