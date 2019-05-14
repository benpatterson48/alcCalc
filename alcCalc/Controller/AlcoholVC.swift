//
//  AlcoholVC.swift
//  alcCalc
//
//  Created by Ben Patterson on 3/7/19.
//  Copyright © 2019 Ben Patterson. All rights reserved.
//

import UIKit

class AlcoholVC: UIViewController, UITextFieldDelegate {
    
    var calculationMethodAboutText = String()
    var caloriesSelected: Bool = true
    var abvSelected: Bool = false
    var abvView = ABVInputView()
    
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
        title.text = "Alcohol Conversion"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
//    private let topViewHeaderLearnMoreBtn: UIButton = {
//        let button = UIButton()
//        button.setImage(UIImage(named: "info-Icon"), for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.addTarget(self, action: #selector(linksBtnWasPressed), for: .touchUpInside)
//        return button
//    }()
//
//    @objc func linksBtnWasPressed() {
//        let linksVC = LinksVC()
//        presentSlideLeft(viewControllerToPresent: linksVC)
//    }
    
    private let conversionTitleTxtLbl: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.75)
        lbl.font = UIFont.mainSemiBoldFont(ofSize: 20)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    private let conversionMethodTextLbl: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.6)
        lbl.font = UIFont.mainFont(ofSize: 14)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let calcMethodSegmentedControl: UISegmentedControl = {
        let items = ["Calories", "ABV"]
        let segment = UISegmentedControl(items: items)
        segment.selectedSegmentIndex = 0
        segment.layer.cornerRadius = 5
        segment.backgroundColor = .white
        segment.tintColor = #colorLiteral(red: 0, green: 0.6745098039, blue: 0.9294117647, alpha: 1)
        segment.setTitleTextAttributes([NSAttributedString.Key.strokeColor: UIColor(red: 51, green: 51, blue: 51, alpha: 100)], for: UIControl.State.normal)
        segment.addTarget(self, action: #selector(segmentedControllerIndexChanged(_:)), for: .valueChanged)
        segment.translatesAutoresizingMaskIntoConstraints = false
        return segment
    }()
    
    let inputFieldTitleLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Enter Calories Below"
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        lbl.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.8010220462)
        lbl.font = UIFont.mainMediumFont(ofSize: 20)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    func toggleBetweenCaloriesAndAbvMethod() {
        if caloriesSelected == true {
            inputFieldTxtField.text = ""
            abvView.isHidden = true
            UIView.animate(withDuration: 0.2, delay: 0.0 ,animations: {
                self.inputFieldTitleLbl.text = "Enter Calories Below"
                self.conversionTitleTxtLbl.text = "Calories Selected"
                self.conversionMethodTextLbl.text = "Calories method converts a drinks calories into carbs and fat macronutrients for easy tracking."
                self.inputFieldTxtField.placeholder = "0"
                self.inputFieldTitleLbl.isHidden = false
                self.inputFieldTxtField.isHidden = false
                self.inputFieldUnderLineView.isHidden = false
            }
            )} else {
            abvView.isHidden = false
            self.conversionTitleTxtLbl.text = "ABV Method Selected"
            self.conversionMethodTextLbl.text = "ABV method converts a drinks ounces and alcoholic percentage into carbs and fat macronutrients for easy tracking."
            abvView.ouncesInputFieldTxtField.text = ""
            abvView.percentInputFieldTxtField.text = "" 
            UIView.animate(withDuration: 0.2, delay: 0.15 ,animations: {
                self.inputFieldTitleLbl.isHidden = true
                self.inputFieldTxtField.isHidden = true
                self.inputFieldUnderLineView.isHidden = true
            }
            )}
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
    
    let inputFieldTxtField: UITextField = {
        let txt = UITextField()
        txt.borderStyle = .none
        txt.placeholder = "0"
        txt.textAlignment = .center
        txt.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.9030928938)
        txt.keyboardType = .decimalPad
        txt.font = UIFont.boldSystemFont(ofSize: 125)
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    func checkMaxLength(textField: UITextField!, maxLength: Int) {
        if textField.text?.count ?? 0 > maxLength {
            textField.deleteBackward()
        }
    }
    
    let inputFieldUnderLineView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.2479666096)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let calculateBtn: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.backgroundColor = #colorLiteral(red: 0, green: 0.6745098039, blue: 0.9294117647, alpha: 1)
        button.setTitle("CALCULATE", for: .normal)
        button.titleLabel?.font = UIFont.mainBoldFont(ofSize: 26)
        button.addTarget(self, action: #selector(calculateWithCaloriesBtnWasPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func calculateWithCaloriesBtnWasPressed() {
        if caloriesSelected == true {
            calculateBtnWasPressedForCalories()
        } else {
            calculateBtnWasPressedForABV()
        }
    }
    
    func calculateBtnWasPressedForCalories() {
        if inputFieldTxtField.text == "" {
            self.inputFieldTxtField.shake()
            view.endEditing(true)
            return
        } else {
            let resultsVC = AlcoholResultsVC()
            resultsVC.initDataForCalories(caloriesSent: Double(Int(inputFieldTxtField.text!)!))
            resultsVC.modalPresentationStyle = .custom
            inputFieldTxtField.text = ""
            view.endEditing(true)
            present(resultsVC, animated: true, completion: nil)
        }
    }
    
    func calculateBtnWasPressedForABV() {
        if abvView.ouncesInputFieldTxtField.text == "" || abvView.percentInputFieldTxtField.text == "" {
            self.inputFieldTxtField.shake()
            view.endEditing(true)
            return
        } else {
            let ounces = Double(abvView.ouncesInputFieldTxtField.text!)
            let percent = Double(abvView.percentInputFieldTxtField.text!)
            let resultsVC = AlcoholResultsVC()
            resultsVC.initDataForABV(ounces: ounces ?? 0, percent: percent ?? 0)
            view.endEditing(true)
            resultsVC.modalPresentationStyle = .custom
            abvView.ouncesInputFieldTxtField.text = ""
            abvView.percentInputFieldTxtField.text = ""
            present(resultsVC, animated: true, completion: nil)
        }
    }

    override func viewDidLoad() {
        if isEditing {
            checkMaxLength(textField: inputFieldTxtField, maxLength: 3)
        }
        if UIDevice.current.modelName == "iPhone 5s" || UIDevice.current.modelName == "iPhone SE" {
            changeScreenFor5()
        }
        if UIDevice.current.modelName == "iPhone 6" || UIDevice.current.modelName == "iPhone 7" || UIDevice.current.modelName == "iPhone 8" {
            topViewHeaderBg.heightAnchor.constraint(equalToConstant: 85).isActive = true
        }
        abvView.isHidden = true
        self.view.backgroundColor = .white
        segmentedControllerIndexChanged(calcMethodSegmentedControl)
        setupHeaderBGConstraints()
        view.bindToKeyboard()
        inputFieldTxtField.delegate = self
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        if inputFieldTxtField.isEditing == true {
            view.endEditing(true)
        }
    }
    
    func changeScreenFor5() {
        topViewHeaderTitleLbl.font = UIFont.mainSemiBoldFont(ofSize: 22)
        topViewHeaderBg.heightAnchor.constraint(equalToConstant: 85).isActive = true
        calcMethodSegmentedControl.heightAnchor.constraint(equalToConstant: 35).isActive = true
        calculateBtn.heightAnchor.constraint(equalToConstant: 45).isActive = true
        calculateBtn.titleLabel?.font = UIFont.mainSemiBoldFont(ofSize: 22)
        abvView.ouncesInputFieldTitleLbl.font = UIFont.mainMediumFont(ofSize: 16)
        abvView.percentInputFieldTitleLbl.font = UIFont.mainMediumFont(ofSize: 16)
        self.conversionTitleTxtLbl.font = UIFont.mainSemiBoldFont(ofSize: 16)
        self.conversionMethodTextLbl.font = UIFont.mainFont(ofSize: 12)
    }

    func setupHeaderBGConstraints() {
        view.addSubview(topViewHeaderBg)
//        topViewHeaderBg.addSubview(topViewHeaderLearnMoreBtn)
        topViewHeaderBg.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topViewHeaderBg.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topViewHeaderBg.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    
        setupHeaderViewsConstraints()
    }
    
    func setupHeaderViewsConstraints() {
        topViewHeaderBg.addSubview(topViewHeaderTitleLbl)
        topViewHeaderTitleLbl.centerXAnchor.constraint(equalTo: topViewHeaderBg.centerXAnchor).isActive = true 
        topViewHeaderTitleLbl.bottomAnchor.constraint(equalTo: topViewHeaderBg.bottomAnchor, constant: -16).isActive = true
        
//        topViewHeaderLearnMoreBtn.trailingAnchor.constraint(equalTo: topViewHeaderBg.trailingAnchor, constant: -16).isActive = true
//        topViewHeaderLearnMoreBtn.heightAnchor.constraint(equalToConstant: 25).isActive = true
//        topViewHeaderLearnMoreBtn.widthAnchor.constraint(equalToConstant: 25).isActive = true
//        topViewHeaderLearnMoreBtn.centerYAnchor.constraint(equalTo: topViewHeaderTitleLbl.centerYAnchor).isActive = true
        
        createPoweredByStackViewAndConstraints()
    }
    
    func createPoweredByStackViewAndConstraints() {
        
        let methodInformationStackView = UIStackView(arrangedSubviews: [conversionTitleTxtLbl, conversionMethodTextLbl])
        view.addSubview(methodInformationStackView)
        methodInformationStackView.translatesAutoresizingMaskIntoConstraints = false
        methodInformationStackView.axis = .vertical
        methodInformationStackView.spacing = 20
        methodInformationStackView.distribution = .fillProportionally

        methodInformationStackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 3/4).isActive = true
        methodInformationStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        conversionTitleTxtLbl.topAnchor.constraint(equalTo: methodInformationStackView.topAnchor, constant: 2).isActive = true
        conversionMethodTextLbl.bottomAnchor.constraint(equalTo: methodInformationStackView.bottomAnchor, constant: -2).isActive = true
    
        let inputTextFieldStackView = UIStackView(arrangedSubviews: [
                inputFieldTitleLbl,
                inputFieldTxtField,
                inputFieldUnderLineView
            ])
        inputTextFieldStackView.translatesAutoresizingMaskIntoConstraints = false
        inputTextFieldStackView.axis = .vertical
        inputTextFieldStackView.spacing = 5
        inputTextFieldStackView.distribution = .fillProportionally
        inputFieldUnderLineView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        let bodyViewsStackView = UIStackView(arrangedSubviews: [
                calcMethodSegmentedControl,
                inputTextFieldStackView,
                abvView,
                calculateBtn
            ])
        view.addSubview(bodyViewsStackView)
        bodyViewsStackView.translatesAutoresizingMaskIntoConstraints = false
        bodyViewsStackView.axis = .vertical
        bodyViewsStackView.distribution = .fill
        bodyViewsStackView.spacing = 30
        
        bodyViewsStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 5/6).isActive = true
        bodyViewsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bodyViewsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32).isActive = true

        calcMethodSegmentedControl.heightAnchor.constraint(equalToConstant: 45).isActive = true
        calculateBtn.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        if UIDevice.current.modelName == "iPhone X" || UIDevice.current.modelName == "iPhone XR" || UIDevice.current.modelName == "iPhone XS" || UIDevice.current.modelName == "iPhone XS Max" {
            bodyViewsStackView.spacing = 15
            topViewHeaderBg.heightAnchor.constraint(equalToConstant: 110).isActive = true
            methodInformationStackView.topAnchor.constraint(equalTo: topViewHeaderBg.bottomAnchor, constant: 32).isActive = true
        } else {
            methodInformationStackView.topAnchor.constraint(equalTo: topViewHeaderBg.bottomAnchor, constant: 16).isActive = true
            topViewHeaderBg.heightAnchor.constraint(equalToConstant: 110).isActive = true
            bodyViewsStackView.spacing = 30
            bodyViewsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true 
        }
    }

}
