//
//  GraphView.swift
//  GraphingCalculator
//
//  Created by asokol on 12/11/17.
//  Copyright © 2017 asokol. All rights reserved.
//

import UIKit


class Graph: UIView{
    
    var finalString = ""
    let shapeLayer = CAShapeLayer()
    var numPoints: CGFloat = 10.0
    
//    func setup(){
//        shapeLayer.strokeColor = UIColor.black.cgColor
//        shapeLayer.lineWidth = 1.0
//        shapeLayer.position = CGPoint(x: 200, y: 200)
//    }
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        drawOrigin(numPoints: numPoints)
//        setup()
//
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    
    func drawOrigin(numPoints : CGFloat){
        let xEdge = self.bounds.width/2
        let yEdge = self.bounds.height/2
        let path = UIBezierPath()
        path.append(drawLine(pt1: CGPoint(x: -xEdge, y: 0),
                             pt2: CGPoint(x: xEdge, y: 0)))
        path.append(drawLine(pt1: CGPoint(x: 0, y: -yEdge),
                             pt2: CGPoint(x: 0, y: yEdge)))
        if numPoints >= 1{
            let breakLength = self.bounds.width/numPoints
            let dashSize = CGFloat(50/numPoints)
            var iter = -xEdge
            while iter <= xEdge{
                path.append(drawSegX(point: CGPoint(x: Double(iter), y: 0), size: dashSize))
                path.append(drawSegY(point: CGPoint(x: 0, y: Double(iter)), size: dashSize))
                iter += breakLength
            }
        }
        shapeLayer.path = path.cgPath
        path.close()
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
}
