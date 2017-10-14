//
//  ViewController.swift
//  numIncrement
//
//  Created by asokol on 9/21/17.
//  Copyright © 2017 asokol. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var numLabel: UILabel!
    @IBOutlet weak var subtractNum: UIButton!
    @IBOutlet weak var addNum: UIButton!
    var numStore: Int = 0
    
    @IBAction func subtractOne(_ sender: Any) {
        numStore = numStore - 1
        changeCol(num: numStore)
        updateLabel()
    }
    
    @IBAction func addOne(_ sender: Any) {
        numStore = numStore + 1
        changeCol(num: numStore)
        updateLabel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel()
    }
    
    //Method that allows subtractOne and addOne to update numLabel when pressed
    func updateLabel(){
        numLabel.text = String(numStore)
    }
    
    //Switch Case to change Label Color based on value
    func changeCol(num: Int){
        switch num{
        case let x where x < 0:
            numLabel.textColor = UIColor.red
        case let x where x > 0:
            numLabel.textColor = UIColor.blue
        default:
            numLabel.textColor = UIColor.black
        }
    }
}


