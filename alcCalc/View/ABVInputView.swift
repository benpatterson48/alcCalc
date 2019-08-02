//
//  ABVInputView.swift
//  alcCalc
//
//  Created by Ben Patterson on 3/20/19.
//  Copyright © 2019 Ben Patterson. All rights reserved.
//

import UIKit

class ABVInputView: UIView {
    
    let percentInputFieldTitleLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Enter ABV % Below"
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        lbl.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.8010220462)
        lbl.font = UIFont.mainMediumFont(ofSize: 20)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let ouncesInputFieldTitleLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Enter Ounces Below"
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        lbl.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.8010220462)
        lbl.font = UIFont.mainMediumFont(ofSize: 20)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let percentInputFieldTxtField: UITextField = {
        let txt = UITextField()
        txt.borderStyle = .none
        txt.placeholder = "0%"
        txt.textAlignment = .center
        txt.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.9030928938)
        txt.keyboardType = .decimalPad
        txt.font = UIFont.boldSystemFont(ofSize: 65)
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    let ouncesInputFieldTxtField: UITextField = {
        let txt = UITextField()
        txt.borderStyle = .none
        txt.placeholder = "0oz"
        txt.textAlignment = .center
        txt.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.9030928938)
        txt.keyboardType = .decimalPad
        txt.font = UIFont.boldSystemFont(ofSize: 65)
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    let percentInputFieldUnderLineView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.2479666096)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let ouncesPercentInputFieldUnderLineView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.2479666096)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStackViews()
    }
    
    func setupStackViews() {
        let ouncesStackView = UIStackView(arrangedSubviews: [ouncesInputFieldTitleLbl, ouncesInputFieldTxtField, ouncesPercentInputFieldUnderLineView])
        ouncesStackView.translatesAutoresizingMaskIntoConstraints = false
        ouncesStackView.axis = .vertical
        ouncesStackView.spacing = 15
        ouncesStackView.distribution = .fillProportionally
        ouncesPercentInputFieldUnderLineView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        let percentStackView = UIStackView(arrangedSubviews: [percentInputFieldTitleLbl, percentInputFieldTxtField, percentInputFieldUnderLineView])
        percentStackView.translatesAutoresizingMaskIntoConstraints = false
        percentStackView.axis = .vertical
        percentStackView.spacing = 15
        percentStackView.distribution = .fillProportionally
        percentInputFieldUnderLineView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        let abvInputsStackView = UIStackView(arrangedSubviews: [ouncesStackView, percentStackView])
        addSubview(abvInputsStackView)
        abvInputsStackView.translatesAutoresizingMaskIntoConstraints = false
        abvInputsStackView.spacing = 10
        abvInputsStackView.distribution = .fillEqually
        
        abvInputsStackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        abvInputsStackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        abvInputsStackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        abvInputsStackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        if UIDevice.current.modelName == "iPhone X" || UIDevice.current.modelName == "iPhone XR" || UIDevice.current.modelName == "iPhone XS" || UIDevice.current.modelName == "iPhone XS Max" || UIDevice.current.modelName == "iPhone 7 Plus" || UIDevice.current.modelName == "iPhone 8 Plus" {
            abvInputsStackView.axis = .vertical
            abvInputsStackView.spacing = 5
            percentStackView.spacing = 5
            ouncesStackView.spacing = 5
            ouncesInputFieldTxtField.font = UIFont.boldSystemFont(ofSize: 80)
            percentInputFieldTxtField.font = UIFont.boldSystemFont(ofSize: 80)
        } else {
            abvInputsStackView.axis = .horizontal
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
