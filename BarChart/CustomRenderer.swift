//
//  CustomRenderer.swift
//  BarChart
//
//  Created by ksolves on 15/01/20.
//  Copyright © 2020 ksolves. All rights reserved.
//


import Foundation
import CoreGraphics
import Charts


open class CustomRenderer: BarChartRenderer
{
    open override func drawValue(context: CGContext, value: String, xPos: CGFloat, yPos: CGFloat, font: NSUIFont, align: NSTextAlignment, color: NSUIColor) {
        super.drawValue(context: context, value: value, xPos: xPos, yPos: yPos, font: font, align: align, color: color)
    }
    
}
