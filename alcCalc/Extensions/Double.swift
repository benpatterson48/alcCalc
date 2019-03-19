//
//  Double.swift
//  alcCalc
//
//  Created by Ben Patterson on 3/15/19.
//  Copyright © 2019 Ben Patterson. All rights reserved.
//

import Foundation

extension Double {
    func rounded(digits: Int) -> Double {
        let multiplier = pow(10.0, Double(digits))
        return (self * multiplier).rounded() / multiplier
    }
}
