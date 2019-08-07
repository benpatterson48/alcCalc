//
//  TitleWithInfoBtnAndIcon.swift
//  alcCalc
//
//  Created by Ben Patterson on 8/7/19.
//  Copyright © 2019 Ben Patterson. All rights reserved.
//

import UIKit

class TitleWithInfoBtnAndIcon: UIView {
	
	let icon: UIImageView = {
		let icon = UIImageView()
		icon.contentMode = .scaleAspectFit
		icon.translatesAutoresizingMaskIntoConstraints = false
		icon.widthAnchor.constraint(equalToConstant: 25).isActive = true
		icon.heightAnchor.constraint(equalToConstant: 25).isActive = true
		return icon
	}()
	
	let title: UILabel = {
		let title = UILabel()
		title.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.6)
		title.textAlignment = .left
		title.font = UIFont.systemFont(ofSize: 12)
		title.translatesAutoresizingMaskIntoConstraints = false
		return title
	}()
	
	let infoButton: UIButton = {
		let info = UIButton()
		info.contentMode = .scaleAspectFit
		info.translatesAutoresizingMaskIntoConstraints = false
		info.setBackgroundImage(UIImage(named: "info"), for: .normal)
		info.widthAnchor.constraint(equalToConstant: 15).isActive = true
		info.heightAnchor.constraint(equalToConstant: 15).isActive = true
		return info
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		createStackView()
	}
	
	public convenience init(iconImage: String, titleText: String) {
		self.init()
		self.icon.image = UIImage(named: iconImage)
		self.title.text = titleText
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func createStackView() {
		let stack = UIStackView(arrangedSubviews: [icon, title, infoButton])
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.axis = .horizontal
		stack.spacing = 5
		stack.alignment = .top
		stack.distribution = .fillProportionally
		
		addSubview(stack)
		stack.topAnchor.constraint(equalTo: topAnchor).isActive = true
		stack.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
		stack.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
		stack.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
	}
}
