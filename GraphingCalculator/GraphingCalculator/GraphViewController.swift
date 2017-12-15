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
    let graph = Graph()
    var ptArr: [CGPoint] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        equationLabel.text = data?.finalString
        //ptArr = (data?.populatePointArray(equation: equationLabel.text!, numPoints: graph.numPoints, view: graph.shapeLayer))!
        
    }
    

}



