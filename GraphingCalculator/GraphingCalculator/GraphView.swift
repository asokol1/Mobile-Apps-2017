//
//  GraphView.swift
//  GraphingCalculator
//
//  Created by asokol on 12/11/17.
//  Copyright © 2017 asokol. All rights reserved.
//

import UIKit

//let viewWidth = view.bounds.width
//let viewHeight = view.bounds.height


class Graph{
    
    func drawOrigin(numPoints : Int) -> CGPath{
        let xEdge = CGFloat(200)//viewWidth/2
        let yEdge = CGFloat(200)//viewHeight/2
        let path = UIBezierPath()
        path.append(drawLine(pt1: CGPoint(x: -xEdge, y: 0),
                             pt2: CGPoint(x: xEdge, y: 0)))
        path.append(drawLine(pt1: CGPoint(x: 0, y: -yEdge),
                             pt2: CGPoint(x: 0, y: yEdge)))
        if numPoints >= 1{
            let breakLength = CGFloat(200/numPoints)
            let dashSize = CGFloat(50/numPoints)
            var iter = -xEdge
            while iter <= xEdge{
                path.append(drawSegX(point: CGPoint(x: CGFloat(iter), y: 0), size: dashSize))
                path.append(drawSegY(point: CGPoint(x: 0, y: CGFloat(iter)), size: dashSize))
                iter += breakLength
            }
        }
        path.close()
        return path.cgPath
    }
    
    func drawLine(pt1: CGPoint, pt2: CGPoint) -> UIBezierPath{
        let path = UIBezierPath()
        path.move(to: pt1)
        path.addLine(to: pt2)
        return path
    }
    
    func drawSegX(point: CGPoint, size: CGFloat) -> UIBezierPath{
        let path = UIBezierPath()
        path.append(drawLine(pt1: CGPoint(x: point.x, y: point.y-size),
                             pt2: CGPoint(x: point.x, y: point.y+size)))
        path.close()
        return path
    }
    
    func drawSegY(point: CGPoint, size: CGFloat) -> UIBezierPath{
        let path = UIBezierPath()
        path.append(drawLine(pt1: CGPoint(x: point.x-size, y: point.y),
                             pt2: CGPoint(x: point.x+size, y: point.y)))
        path.close()
        return path
    }
    let stringLook = "x^2 + 3x"
    let stringActual = "(x)^^2 + 3 * x"
    func solve(equation: String, for: Double) -> Double{
        let expression = NSExpression(format: equation)
        let value = expression.expressionValue(with: nil, context: nil) as! Double
        return value
    }
}
