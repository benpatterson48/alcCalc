//
//  WordButtons.swift
//  alcCalc
//
//  Created by Ben Patterson on 5/13/19.
//  Copyright © 2019 Ben Patterson. All rights reserved.
//

import UIKit

class WordButtons: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setTitleColor(.white, for: .normal)
        backgroundColor = #colorLiteral(red: 0, green: 0.6745098039, blue: 0.9294117647, alpha: 1)
        layer.cornerRadius = 5
        titleLabel?.adjustsFontSizeToFitWidth = true 
        titleLabel?.font = UIFont.mainSemiBoldFont(ofSize: 16)
        translatesAutoresizingMaskIntoConstraints = false
        
        if UIDevice.current.name == "iPhone 5s" || UIDevice.current.name == "iPhone SE" {
            titleLabel?.font = UIFont.mainSemiBoldFont(ofSize: 12)
        } else if UIDevice.current.name == "iPhone 6" || UIDevice.current.name == "iPhone 7" || UIDevice.current.name == "iPhone 8" {
            titleLabel?.font = UIFont.mainSemiBoldFont(ofSize: 14)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
