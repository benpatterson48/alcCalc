//
//  PopupVC.swift
//  alcCalc
//
//  Created by Ben Patterson on 8/15/19.
//  Copyright © 2019 Ben Patterson. All rights reserved.
//

import UIKit

class PopupVC: UIViewController {

	var popupContent = UIView()
	var contentView = UIView()
	var scrollView = UIScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6)
		let tap = UITapGestureRecognizer(target: self, action: #selector(dismissView))
		view.addGestureRecognizer(tap)
		
		scrollView.bounces = false
		scrollView.layer.cornerRadius = 10
		contentView.layer.cornerRadius = 10
		
		addViews()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
		scrollView.contentSize = CGSize(width: self.view.frame.width, height: 1300)
		scrollView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
	}
	
	@objc func dismissView() {
		dismiss(animated: true, completion: nil)
	}
	
	public convenience init(viewfor: UIView) {
		self.init()
		popupContent = viewfor
		popupContent.layer.cornerRadius = 10
		popupContent.backgroundColor = .white
	}

	func addViews() {
		view.addSubview(scrollView)
		scrollView.addSubview(contentView)
		contentView.addSubview(popupContent)
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		contentView.translatesAutoresizingMaskIntoConstraints = false
		popupContent.translatesAutoresizingMaskIntoConstraints = false
		
		scrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
		scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		scrollView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 7/8).isActive = true
		scrollView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 3/4).isActive = true
		
		contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
		contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
		contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
		contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
		
		popupContent.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
		popupContent.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
		popupContent.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
		popupContent.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
	}
	
}
