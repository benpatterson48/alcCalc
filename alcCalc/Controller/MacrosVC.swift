//
//  MacrosVC.swift
//  alcCalc
//
//  Created by Ben Patterson on 5/13/19.
//  Copyright © 2019 Ben Patterson. All rights reserved.
//

import UIKit

class MacrosVC: UIViewController {
    
    private let topViewHeaderBg: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0, green: 0.6745098039, blue: 0.9294117647, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let topViewHeaderTitleLbl: UILabel = {
        let title = UILabel()
        title.textColor = .white
        title.textAlignment = .left
        title.font = UIFont.mainSemiBoldFont(ofSize: 26)
        title.text = "Alcohol Conversion"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white 
    }


}
