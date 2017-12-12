//
//  ViewController.swift
//  GraphingCalculator
//
//  Created by asokol on 12/11/17.
//  Copyright © 2017 asokol. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var stringToParse: [String] = []
    var largeNum = ""
    var count = 0
    
    @IBOutlet weak var equationLabel: UITextView!
    
    @IBAction func allClear(_ sender: Any) {
        equationLabel.text.removeAll()
        stringToParse.removeAll()
    }
    @IBAction func cos(_ sender: Any) {
        updateStrings(val1: "cos(", val2: "cos(")
    }
    @IBAction func sin(_ sender: Any) {
        updateStrings(val1: "sin(", val2: "sin(")
    }
    @IBAction func tan(_ sender: Any) {
        updateStrings(val1: "tan(", val2: "tan(")
        
    }
    @IBAction func power(_ sender: Any) {
        updateStrings(val1: "^(", val2: "pow(\(stringToParse[count-1]),(")
        
    }
    @IBAction func sqrt(_ sender: Any) {
        updateStrings(val1: "√(", val2: "sqrt(")
        
    }
    @IBAction func pi(_ sender: Any) {
        updateStrings(val1: "π", val2: ".pi")
        
    }
    @IBAction func variable(_ sender: Any) {
        updateStrings(val1: "x", val2: "(var)")
        
    }
    @IBAction func leftParens(_ sender: Any) {
        updateStrings(val1: "(", val2: "(")
        
    }
    @IBAction func rightParens(_ sender: Any) {
        updateStrings(val1: ")", val2: ")")
        
    }
    @IBAction func div(_ sender: Any) {
        updateStrings(val1: "/", val2: "/")
        
    }
    @IBAction func mult(_ sender: Any) {
        updateStrings(val1: "*", val2: "*")
        
    }
    @IBAction func sub(_ sender: Any) {
        updateStrings(val1: "-", val2: "-")
        
    }
    @IBAction func add(_ sender: Any) {
        updateStrings(val1: "+", val2: "+")
        
    }
    @IBAction func decimal(_ sender: Any) {
        updateStrings(val1: ".", val2: ".")
        
    }
    @IBAction func zero(_ sender: Any) {
        updateStrings(val1: "0", val2: "0")
        
    }
    @IBAction func one(_ sender: Any) {
        updateStrings(val1: "1", val2: "1")
        
    }
    @IBAction func two(_ sender: Any) {
        updateStrings(val1: "2", val2: "2")
        
    }
    @IBAction func three(_ sender: Any) {
        updateStrings(val1: "3", val2: "3")
        
    }
    @IBAction func four(_ sender: Any) {
        updateStrings(val1: "4", val2: "4")
        
    }
    @IBAction func five(_ sender: Any) {
        updateStrings(val1: "5", val2: "5")
        
    }
    @IBAction func six(_ sender: Any) {
        updateStrings(val1: "6", val2: "6")
        
    }
    @IBAction func seven(_ sender: Any) {
        updateStrings(val1: "7", val2: "7")
        
    }
    @IBAction func eight(_ sender: Any) {
        updateStrings(val1: "8", val2: "8")
        
    }
    @IBAction func nine(_ sender: Any) {
        updateStrings(val1: "9", val2: "9")
    }
    
    @IBAction func equals(_ sender: Any) {
    }
    
    let values = ["1" , "2" , "3" , "4" , "5" , "6" , "7" , "8" , "9"]
    func updateStrings(val1: String, val2: String){
        equationLabel.text.append(val1)
        
        if !values.contains(val2) {
            if largeNum != ""{
                stringToParse.append(largeNum)
                count+=1
                largeNum.removeAll()
            }
            stringToParse.append(val2)
            count+=1
            print(count, stringToParse)
        }else{
            largeNum.append(val2)
    }
}
}
