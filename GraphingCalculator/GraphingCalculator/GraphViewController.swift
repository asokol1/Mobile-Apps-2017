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
    
    @IBOutlet weak var graphView: UIView!
    
    var finalString = ""
    let graph = Graph()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        graphView.display(graph.shapeLayer)
        graph.setup()
        
//        print(graph.solve(equation: "8*3", variable: 2))
//        graph.frame = CGRect(x: graphView.center.x, y: graphView.center.y, width: graphView.bounds.width, height: graphView.bounds.height)
//        graph.backgroundColor = UIColor.white
//        graphView.addSubview(graph)

    }

    
}
