//
//  Macros.swift
//  alcCalc
//
//  Created by Ben Patterson on 8/6/19.
//  Copyright © 2019 Ben Patterson. All rights reserved.
//

import UIKit

class Macros: UIViewController, UIScrollViewDelegate {
	
	var scrollView = UIScrollView()
	var contentView = UIView()
	
	var topView = UIView()
	let macrosView = MacrosContentView()

	override func viewDidLoad() {
        super.viewDidLoad()
		addViews()
		view.backgroundColor = .white
		topView.backgroundColor = .white 
		
		scrollView.bounces = false
		scrollView.showsVerticalScrollIndicator = false
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
		
		scrollView.contentSize = CGSize(width: self.view.frame.width, height: 1300)
		scrollView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
	}

	fileprivate func addViews() {
		view.addSubview(scrollView)
		view.addSubview(topView)
		scrollView.addSubview(contentView)
		contentView.addSubview(macrosView)
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		topView.translatesAutoresizingMaskIntoConstraints = false
		contentView.translatesAutoresizingMaskIntoConstraints = false
		macrosView.translatesAutoresizingMaskIntoConstraints = false
		
		topView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
		topView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		topView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
		topView.heightAnchor.constraint(equalToConstant: 24).isActive = true
		topView.bottomAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
		
		scrollView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
		scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
		scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
		scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		
		contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
		contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
		contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
		contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
		
		macrosView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
		macrosView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32).isActive = true
		macrosView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32).isActive = true
		macrosView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
	}
	
}
