//
//  MainVC.swift
//  alcCalc
//
//  Created by Ben Patterson on 3/7/19.
//  Copyright © 2019 Ben Patterson. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITextFieldDelegate {
    
    var calculationMethodAboutText = String()
    var caloriesSelected: Bool = true
    var abvSelected: Bool = false
    
    private let topViewHeaderBg: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0, green: 0.7743021846, blue: 0.8264589906, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let topViewHeaderTitleLbl: UILabel = {
        let title = UILabel()
        title.textColor = .white
        title.textAlignment = .left
        title.font = UIFont.mainSemiBoldFont(ofSize: 28)
        title.text = "Alcohol Calculator"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let topViewHeaderLearnMoreBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "info-Icon"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let poweredByTextLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Powered by:"
        lbl.textAlignment = .center
        lbl.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.5)
        lbl.font = UIFont.italicSystemFont(ofSize: 12)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let fdlLogoImgView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "fdl_logo")
        imgView.contentMode = .scaleAspectFit
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private let fdlTitleNameLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Flexible Dieting Lifestyle"
        lbl.textAlignment = .center
        lbl.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.5)
        lbl.font = UIFont.italicSystemFont(ofSize: 14)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let calcMethodSegmentedControl: UISegmentedControl = {
        let items = ["Calories", "ABV"]
        let segment = UISegmentedControl(items: items)
        segment.selectedSegmentIndex = 0
        segment.layer.cornerRadius = 5
        segment.backgroundColor = .white
        segment.tintColor = #colorLiteral(red: 0, green: 0.7743021846, blue: 0.8264589906, alpha: 1)
        segment.setTitleTextAttributes([NSAttributedString.Key.strokeColor: UIColor(red: 51, green: 51, blue: 51, alpha: 100)], for: UIControl.State.normal)
        segment.addTarget(self, action: #selector(segmentedControllerIndexChanged(_:)), for: .valueChanged)
        segment.translatesAutoresizingMaskIntoConstraints = false
        return segment
    }()
    
    @objc func segmentedControllerIndexChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            caloriesSelected = true
            abvSelected = false
            aboutTrackMethodLbl.text =
            """
            Tracking method description for
            calories selection method, will
            change for ABV.
            """
        case 1:
            caloriesSelected = false
            abvSelected = true
            aboutTrackMethodLbl.text =
            """
            Tracking method description for
            ABV selection method, will
            change for calories.
            """
        default:
            caloriesSelected = true
            abvSelected = false
            aboutTrackMethodLbl.text =
            """
            Tracking method description for
            calories selection method, will
            change for ABV.
            """
        }
    }
    
    private let aboutTrackMethodTitle: UILabel = {
        let title = UILabel()
        title.text = "About Tracking Method"
        title.textAlignment = .center
        title.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.8)
        title.font = UIFont.mainMediumFont(ofSize: 18)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let aboutTrackMethodLbl: UILabel = {
        let about = UILabel()
        about.text =
        """
        Tracking method description for
        calories selection method, will
        change for ABV.
        """
        about.textAlignment = .center
        about.numberOfLines = 0
        about.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.5)
        about.font = UIFont.systemFont(ofSize: 16)
        about.translatesAutoresizingMaskIntoConstraints = false
        return about
    }()
    
    private let inputFieldTitleLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Click to Enter Calories Below"
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        lbl.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.8010220462)
        lbl.font = UIFont.mainMediumFont(ofSize: 20)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
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
    
    private let inputFieldUnderLineView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.5)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let calculateBtn: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.backgroundColor = #colorLiteral(red: 1, green: 0.3647058824, blue: 0.3647058824, alpha: 1)
        button.setTitle("CALCULATE", for: .normal)
        button.titleLabel?.font = UIFont.mainBoldFont(ofSize: 26)
        button.addTarget(self, action: #selector(calculateBtnWasPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func calculateBtnWasPressed() {
        if inputFieldTxtField.text == "" {
            self.inputFieldTxtField.shake()
        } else {
            let resultsVC = ResultsVC()
            resultsVC.initData(caloriesSent: Double(Int(inputFieldTxtField.text!)!))
            resultsVC.modalPresentationStyle = .currentContext
            present(resultsVC, animated: true, completion: nil)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupHeaderBGConstraints()
        view.bindToKeyboard()
        inputFieldTxtField.delegate = self
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        if inputFieldTxtField.isEditing == true {
            view.endEditing(true)
            calculateBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
            calculateBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32).isActive = true
            calculateBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32).isActive = true
        }
    }

    func setupHeaderBGConstraints() {
        view.addSubview(topViewHeaderBg)
        topViewHeaderBg.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topViewHeaderBg.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topViewHeaderBg.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topViewHeaderBg.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        setupHeaderViewsConstraints()
    }
    
    func setupHeaderViewsConstraints() {
        topViewHeaderBg.addSubview(topViewHeaderTitleLbl)
        topViewHeaderBg.addSubview(topViewHeaderLearnMoreBtn)
        topViewHeaderTitleLbl.leadingAnchor.constraint(equalTo: topViewHeaderBg.leadingAnchor, constant: 24).isActive = true
        topViewHeaderTitleLbl.bottomAnchor.constraint(equalTo: topViewHeaderBg.bottomAnchor, constant: -16).isActive = true
        
        topViewHeaderLearnMoreBtn.trailingAnchor.constraint(equalTo: topViewHeaderBg.trailingAnchor, constant: -24).isActive = true
        topViewHeaderLearnMoreBtn.centerYAnchor.constraint(equalTo: topViewHeaderTitleLbl.centerYAnchor).isActive = true
        topViewHeaderLearnMoreBtn.heightAnchor.constraint(equalToConstant: 25).isActive = true
        topViewHeaderLearnMoreBtn.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        createPoweredByStackViewAndConstraints()
    }
    
    func createPoweredByStackViewAndConstraints() {
        let poweredByStackView = UIStackView(arrangedSubviews: [
                poweredByTextLbl,
                fdlLogoImgView,
                fdlTitleNameLbl
            ])
        view.addSubview(poweredByStackView)
        poweredByStackView.translatesAutoresizingMaskIntoConstraints = false
        poweredByStackView.axis = .vertical
        poweredByStackView.spacing = 5
        poweredByStackView.distribution = .fillProportionally
        
        let aboutTrackMethodStackView = UIStackView(arrangedSubviews: [
                aboutTrackMethodTitle,
                aboutTrackMethodLbl
            ])
        aboutTrackMethodStackView.translatesAutoresizingMaskIntoConstraints = false
        aboutTrackMethodStackView.axis = .vertical
        aboutTrackMethodStackView.spacing = 0
        poweredByStackView.distribution = .fillProportionally
        
        let correctHeight = CGFloat((Int(view.frame.height) - 120) / 4)
        poweredByStackView.heightAnchor.constraint(equalToConstant: correctHeight).isActive = true
        poweredByStackView.topAnchor.constraint(equalTo: topViewHeaderBg.bottomAnchor, constant: 16).isActive = true
        poweredByStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        poweredByTextLbl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        fdlTitleNameLbl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
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
                calculateBtn
            ])
        view.addSubview(bodyViewsStackView)
        bodyViewsStackView.translatesAutoresizingMaskIntoConstraints = false
        bodyViewsStackView.axis = .vertical
        bodyViewsStackView.spacing = 30
        bodyViewsStackView.distribution = .fill
        
//        poweredByStackView.bottomAnchor.constraint(equalTo: bodyViewsStackView.topAnchor, constant: -16).isActive = true
//        bodyViewsStackView.topAnchor.constraint(equalTo: poweredByStackView.bottomAnchor, constant: 16).isActive = true
        bodyViewsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        bodyViewsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32).isActive = true
        bodyViewsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true

        aboutTrackMethodStackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        calcMethodSegmentedControl.heightAnchor.constraint(equalToConstant: 45).isActive = true
        calculateBtn.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }


}
