//
//  ActivityCell.swift
//  alcCalc
//
//  Created by Ben Patterson on 8/7/19.
//  Copyright © 2019 Ben Patterson. All rights reserved.
//

import UIKit

class ActivityCell: UICollectionViewCell {
	
	var activity: Activity? {
		didSet {
			guard let title = activity?.title else { return }
			activitySelection.text = title
			
			guard let radioImageString = activity?.radioImage else { return }
			radioImage.image = UIImage(named: radioImageString)
			
			guard let text = activity?.text else { return }
			activityExample.text = text
		}
	}
	
	let radioImage: UIImageView = {
		let image = UIImageView()
		image.contentMode = .scaleAspectFit
		image.translatesAutoresizingMaskIntoConstraints = false
		return image
	}()
	
	let activitySelection: UILabel = {
		let title = UILabel()
		
		title.translatesAutoresizingMaskIntoConstraints = false
		return title
	}()
	
	let activityExample: UILabel = {
		let text = UILabel()
		text.numberOfLines = 0
		text.translatesAutoresizingMaskIntoConstraints = false
		return text
	}()
	
	override var isSelected: Bool {
		didSet {
			if self.isSelected == true {
				
			} else {
				
			}
		}
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

