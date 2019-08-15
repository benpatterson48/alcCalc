//
//  ActivityDataSource.swift
//  alcCalc
//
//  Created by Ben Patterson on 8/7/19.
//  Copyright © 2019 Ben Patterson. All rights reserved.
//

import UIKit

class ActivityDataSource: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	let activityLevels: [Activity] = [
		Activity(title: "Sedentary", text: "Little movement, desk jobs and 1-2 workouts a week.", multiplier: 1.2),
		Activity(title: "Moderately Active", text: "Trains 3 times per week and is somewhat active", multiplier: 1.4),
		Activity(title: "Above Average", text: "Trains 4-6 times per week and is pretty active", multiplier: 1.6),
		Activity(title: "Very Active", text: "Trains 5-7 days per week and is very active daily", multiplier: 1.8),
		Activity(title: "Competitive Athlete", text: "Competitive Athlete with very high energy demands", multiplier: 2.0)
	]
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return activityLevels.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "activity", for: indexPath) as? ActivityCell else {return UICollectionViewCell()}
		cell.activities = activityLevels[indexPath.item]
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		activityIndicatorSelected = activityLevels[indexPath.item].multiplier
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 225, height: 125)
	}
	
}
