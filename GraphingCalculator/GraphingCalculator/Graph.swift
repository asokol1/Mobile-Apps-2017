//
//  GraphView.swift
//  GraphingCalculator
//
//  Created by asokol on 12/11/17.
//  Copyright © 2017 asokol. All rights reserved.
//

import UIKit


class Graph: UIView{
    var numPoints: CGFloat = 10.0
     
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    let height = 410
    let width = 380
    
    //initializes parameters for each Graph instance called
    func setup(){
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = CGRect(x: width/2, y: height/2, width: width, height: height)
        // The Bezier path needs to be converted to a CGPath before it can be used on a layer.
        shapeLayer.path = drawOrigin(numPoints: numPoints, width: shapeLayer.bounds.width, height: shapeLayer.bounds.height).cgPath
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.lineWidth = 1.0
        self.layer.addSublayer(shapeLayer)
    }
        
    func drawOrigin(numPoints : CGFloat, width: CGFloat, height: CGFloat) -> UIBezierPath{
        let xEdge = width/2
        let yEdge = height/2
        let path = UIBezierPath()
        path.append(drawLine(pt1: CGPoint(x: -xEdge, y: 0),
                             pt2: CGPoint(x: xEdge, y: 0)))
        path.append(drawLine(pt1: CGPoint(x: 0, y: -yEdge),
                             pt2: CGPoint(x: 0, y: yEdge)))
        if numPoints >= 1{
            let breakLength = width/numPoints
            let dashSize = CGFloat(50/numPoints)
            var iter = -xEdge
            while iter <= xEdge{
                path.append(drawSegX(point: CGPoint(x: Double(iter), y: 0), size: dashSize))
                path.append(drawSegY(point: CGPoint(x: 0, y: Double(iter)), size: dashSize))
                iter += breakLength
            }
        }
        path.close()
        return path
    }
    
    func drawLine(pt1: CGPoint, pt2: CGPoint) -> UIBezierPath{
        let path = UIBezierPath()
        path.move(to: pt1)
        path.addLine(to: pt2)
        path.close()
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
}
