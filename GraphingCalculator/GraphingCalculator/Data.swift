//
//  Data.swift
//  GraphingCalculator
//
//  Created by cstest on 12/15/17.
//  Copyright © 2017 asokol. All rights reserved.
//

import UIKit

struct Data{
    var displayString = ""
    var finalString = ""
    let layer = CALayer()
    
    
    func solve(variable: CGFloat) -> CGFloat{
        let expression = NSExpression(format: finalString.replacingOccurrences(of: "x", with: String(describing: variable)))
        let value = expression.expressionValue(with: nil, context: nil) as! CGFloat
        return value
    }
    
    //Create array of calculated CGPoints for easier drawing purposes
    func populatePointArray(numPoints: CGFloat, view: UIView) -> [CGPoint]{
        let points = numPoints/2
        let width = CGFloat(view.bounds.width)
        var ptArr: [CGPoint] = []
        var xVal = CGFloat(-points)
        let pxPerPt =  width / (numPoints)
        var count = -points
        
        while xVal <= width{
            ptArr.append(CGPoint(x: count, y: (solve(variable: CGFloat(count)))))
            count = count + 0.1
            xVal += pxPerPt/10
        }
        
        return ptArr
    }
    
}
