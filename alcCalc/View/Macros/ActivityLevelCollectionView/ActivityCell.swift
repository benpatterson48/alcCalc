//
//  ActivityCell.swift
//  alcCalc
//
//  Created by Ben Patterson on 8/7/19.
//  Copyright © 2019 Ben Patterson. All rights reserved.
//

import UIKit

class ActivityCell: UICollectionViewCell {
	
	var activities: Activity? {
		didSet {
			guard let title = activities?.title else { return }
			activitySelection.text = title
			
			guard let text = activities?.text else { return }
			activityExample.text = text
		}
	}
	
	let radioImage: UIImageView = {
		let image = UIImageView()
		image.contentMode = .scaleAspectFit
		image.image = UIImage(named: "unselected")
		image.translatesAutoresizingMaskIntoConstraints = false
		
		image.heightAnchor.constraint(equalToConstant: 24).isActive = true
		image.widthAnchor.constraint(equalToConstant: 24).isActive = true 
		return image
	}()
	
	let activitySelection: UILabel = {
		let title = UILabel()
		title.textColor = UIColor.lightText
		title.textAlignment = .left
		title.font = UIFont.systemFont(ofSize: 18)
		title.translatesAutoresizingMaskIntoConstraints = false
		return title
	}()
	
	let activityExample: UILabel = {
		let text = UILabel()
		text.numberOfLines = 0
		text.textColor = UIColor.lightText
		text.textAlignment = .left
		text.font = UIFont.systemFont(ofSize: 16)
		text.translatesAutoresizingMaskIntoConstraints = false
		return text
	}()
	
	override var isSelected: Bool {
		didSet {
			if self.isSelected == true {
				self.activitySelection.textColor = UIColor.darkText
				self.activityExample.textColor = UIColor.lightText
				self.layer.borderColor = UIColor.alcBlue.cgColor
				layer.borderWidth = 3.0
				self.activitySelection.font = UIFont.systemFont(ofSize: 18, weight: .medium)
				self.radioImage.image = UIImage(named: "selected")
			} else {
				self.activitySelection.textColor = UIColor.lightText
				self.activityExample.textColor = UIColor.lightText
				self.layer.borderColor = UIColor.alcBlue.withAlphaComponent(0.50).cgColor
				layer.borderWidth = 2.0
				self.activitySelection.font = UIFont.systemFont(ofSize: 18)
				self.radioImage.image = UIImage(named: "unselected")
			}
		}
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupView()
		layer.cornerRadius = 10
		layer.borderWidth = 2.0
		backgroundColor = UIColor.alcWhite
		layer.borderColor = UIColor.alcBlue.withAlphaComponent(0.50).cgColor
	}
	
	func setupView() {
		let cellStack = UIStackView(arrangedSubviews: [radioImage, activitySelection, activityExample])
		cellStack.translatesAutoresizingMaskIntoConstraints = false
		cellStack.axis = .vertical
		cellStack.alignment = .leading
		cellStack.distribution = .fillProportionally
		cellStack.spacing = 3
		
		addSubview(cellStack)
		cellStack.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
		cellStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
		cellStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
		cellStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12).isActive = true
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

