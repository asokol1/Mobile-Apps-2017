//
//  GraphViewController.swift
//  GraphingCalculator
//
//  Created by cstest on 12/14/17.
//  Copyright © 2017 asokol. All rights reserved.
//

import Foundation
import UIKit

class GraphViewController: UIViewController{
    @IBOutlet weak var equationLabel: UILabel!
    @IBOutlet weak var graphView: UIView!
    
    
    var data: Data?
    
    var ptArr: [CGPoint] = []
    var numPoints: CGFloat = 10.0
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let graph = Graph()
        let width = self.graphView.bounds.width
        let height = self.graphView.bounds.height
        let layer = CAShapeLayer()
        
        graph.backgroundColor=UIColor.clear
        graphView.addSubview(graph)
        equationLabel.text = data?.displayString
        
        ptArr = (data?.populatePointArray(numPoints: numPoints, view: graphView))!
//        print("graph",graph.bounds.width)
//        print("pt",ptArr)
        
        let plot = UIBezierPath()
        while ptArr.count > 1{
            var pt1 = ptArr[0]
            var pt2 = ptArr[1]
            pt1 = CGPoint(x: pt1.x * CGFloat(40.0), y: pt1.y * -CGFloat(40.0))
            pt2 = CGPoint(x: pt2.x * CGFloat(40.0), y: pt2.y * -CGFloat(40.0))
            plot.append(graph.drawLine(pt1: pt1, pt2: pt2))
            ptArr.remove(at: 0)
            print(ptArr)
            }
        plot.close()
        layer.frame = CGRect(x: width/2, y: height/2, width: width, height: height)
        layer.path = plot.cgPath
        layer.strokeColor = UIColor.black.cgColor
        layer.lineWidth = 1.0
        
        self.graphView.layer.addSublayer(layer)
        
        
        
    }
    
}



