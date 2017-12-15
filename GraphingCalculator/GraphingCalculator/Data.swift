//
//  Data.swift
//  GraphingCalculator
//
//  Created by cstest on 12/15/17.
//  Copyright © 2017 asokol. All rights reserved.
//

import UIKit

struct Data{
    var finalString = ""
    let layer = CALayer()
    
    
    func solve(variable: CGFloat) -> CGFloat{
        let expression = NSExpression(format: finalString.replacingOccurrences(of: "x", with: String(describing: variable)))
        let value = expression.expressionValue(with: nil, context: nil) as! CGFloat
        return value
    }
    
    //Create array of calculated CGPoints for easier drawing purposes
    func populatePointArray(numPoints: CGFloat, view: UIView) -> [CGPoint]{
        let width = CGFloat(view.bounds.width)
        print(width)
        var ptArr: [CGPoint] = []
        var xVal = CGFloat(0.0)
        let pxPerPt =  width / numPoints
        var count = -numPoints
        
        while xVal <= width{
            ptArr.append(CGPoint(x: count, y: (solve(variable: CGFloat(count)))))
            count = count + 0.1
            xVal += pxPerPt/10
        }
        
        return ptArr
    }
    
}
