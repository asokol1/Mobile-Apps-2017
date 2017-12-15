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
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let graph = Graph()
//        graph.frame = CGRect(x: 16, y: 115, width: 343, height: 343)
//        graph.backgroundColor=UIColor.white
//        graphView.addSubview(graph)
        
        equationLabel.text = data?.finalString
        
    }
    
}



