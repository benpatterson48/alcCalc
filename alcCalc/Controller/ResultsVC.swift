//
//  ResultsVC.swift
//  alcCalc
//
//  Created by Ben Patterson on 3/11/19.
//  Copyright © 2019 Ben Patterson. All rights reserved.
//

import UIKit

class ResultsVC: UIViewController {
    
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.6)
        setupContentViewAndConstraints()
    }
    
    func setupContentViewAndConstraints() {
        view.addSubview(contentView)
        contentView.heightAnchor.constraint(equalToConstant: 350).isActive = true 
        contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -24).isActive = true
    }

}
