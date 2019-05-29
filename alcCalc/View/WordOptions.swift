//
//  WordOptions.swift
//  alcCalc
//
//  Created by Ben Patterson on 5/14/19.
//  Copyright © 2019 Ben Patterson. All rights reserved.
//

import UIKit

class WordOptions: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setTitleColor(#colorLiteral(red: 0, green: 0.6745098039, blue: 0.9294117647, alpha: 1), for: .normal)
        titleLabel?.font = UIFont.mainSemiBoldFont(ofSize: 16)
        translatesAutoresizingMaskIntoConstraints = false
        
        if UIDevice.current.modelName == "iPhone 5s" || UIDevice.current.modelName == "iPhone SE" {
            titleLabel?.font = UIFont.mainSemiBoldFont(ofSize: 12)
        } else if UIDevice.current.modelName == "iPhone 6" || UIDevice.current.modelName == "iPhone 7" || UIDevice.current.modelName == "iPhone 8" {
            titleLabel?.font = UIFont.mainSemiBoldFont(ofSize: 16)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
