//
//  ActivityLevelCollectionView.swift
//  alcCalc
//
//  Created by Ben Patterson on 8/7/19.
//  Copyright © 2019 Ben Patterson. All rights reserved.
//

import UIKit

class ActivityLevelCollectionView: UICollectionView {
	
	let source = ActivityDataSource()
	
	override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
		super.init(frame: frame, collectionViewLayout: layout)
		register(ActivityCell.self, forCellWithReuseIdentifier: "activity")
		let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		self.collectionViewLayout = layout
		self.showsHorizontalScrollIndicator = false 
		
		self.delegate = source
		self.dataSource = source
		
		let index = IndexPath.init(item: 0, section: 0)
		selectItem(at: index, animated: true, scrollPosition: [])
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
