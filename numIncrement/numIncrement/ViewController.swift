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
    var numStore: Int = 0  //Integer used to keep track of and update the String numLabel
    
    @IBAction func subtractOne(_ sender: Any) {
        numStore = numStore - 1
        
        //Updates numLabel color if 0 or negative
        if (numStore == 0){
            numLabel.textColor = UIColor.black
            }
        else if (numStore < 0){
            numLabel.textColor = UIColor.red
        }
        updateLabel()
    }
    
    @IBAction func addOne(_ sender: Any) {
        numStore = numStore + 1
        
        //Updates numLabel color if 0 or positive
        if (numStore == 0){
            numLabel.textColor = UIColor.black
        }
        else if (numStore > 0){
            numLabel.textColor = UIColor.blue
        }
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
}


