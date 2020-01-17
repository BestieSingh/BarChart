//
//  ChartsViewModel.swift
//  BarChart
//
//  Created by ksolves on 16/01/20.
//  Copyright © 2020 ksolves. All rights reserved.
//

import Foundation
import UIKit

class ChartsViewModel {
    var chartsModel = ChartsModel()
    var count: Int = 0
    var values = [Double]()
    var labels = [String]()
    
    func getBgColors() -> [UIColor] {
        var colorArray = [UIColor]()
        guard let rawArray = chartsModel.result?.dashboardData?.bgColor else { return colorArray}
        for raw in rawArray {
            var r, g, b, a: Double
            let stringLen = raw.count
            let temp1 = raw.components(separatedBy: "(")
            let temp2 = temp1[1].components(separatedBy: ")").first
            let trimmedString = temp2?.components(separatedBy: ", ")
            r = Double(trimmedString![0]) as! Double
            g = Double(trimmedString![1]) as! Double
            b = Double(trimmedString![2]) as! Double
            a = Double(trimmedString![3]) as! Double
           
            colorArray.append(UIColor(red: CGFloat(r/255.0), green: CGFloat(g/255.0), blue: CGFloat(b/255.0), alpha: CGFloat(a)))
        }
        return colorArray
    }

}
