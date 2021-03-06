//
//  ViewController.swift
//  GraphingCalculator
//
//  Created by asokol on 12/11/17.
//  Copyright © 2017 asokol. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let parser = StringParser()
    var data = Data()
    func update(var1: String, var2: String){
        equationLabel.text.append(var1)
        parser.updateStrings(val1: var1, val2: var2)
    }
    
    @IBOutlet weak var equationLabel: UITextView!

    func clear(){
        equationLabel.text = "y="
        parser.stringToParse.removeAll()
        parser.largeNum.removeAll()
        parser.test.removeAll()
        parser.count = -1
        data.finalString.removeAll()
    }
    
    //Buttons. So many buttons.
    @IBAction func allClear(_ sender: Any) {
        clear()
    }
    
    @IBAction func cos(_ sender: Any) {
        update(var1: "cos(", var2: "cos(")
    }
    
    @IBAction func sin(_ sender: Any) {
        update(var1: "sin(", var2: "sin(")
    }
    
    @IBAction func tan(_ sender: Any) {
        update(var1: "tan(", var2: "tan(")
    }
    
    @IBAction func power(_ sender: Any) {
        update(var1: "^", var2: "**")
    }
    
    @IBAction func sqrt(_ sender: Any) {
        update(var1: "√(", var2: "sqrt(")
        
    }
    @IBAction func pi(_ sender: Any) {
        update(var1: "π", var2: "3.14159")
    }
    
    @IBAction func variable(_ sender: Any) {
        update(var1: "x", var2: "x")
    }
    
    @IBAction func leftParens(_ sender: Any) {
        update(var1: "(", var2: "(")
    }
    
    @IBAction func rightParens(_ sender: Any) {
        update(var1: ")", var2: ")")
    }
    
    @IBAction func div(_ sender: Any) {
        update(var1: "/", var2: "/")
    }
    
    @IBAction func mult(_ sender: Any) {
        update(var1: "*", var2: "*")
    }
    
    @IBAction func sub(_ sender: Any) {
        update(var1: "-", var2: "-")
    }
    
    @IBAction func add(_ sender: Any) {
        update(var1: "+", var2: "+")
    }
    
    @IBAction func decimal(_ sender: Any) {
        update(var1: ".", var2: ".")
    }
    
    @IBAction func zero(_ sender: Any) {
        update(var1: "0", var2: "0")
    }
    
    @IBAction func one(_ sender: Any) {
        update(var1: "1", var2: "1")
    }
    
    @IBAction func two(_ sender: Any) {
        update(var1: "2", var2: "2")
    }
    
    @IBAction func three(_ sender: Any) {
        update(var1: "3", var2: "3")
    }
    
    @IBAction func four(_ sender: Any) {
        update(var1: "4", var2: "4")
    }
    
    @IBAction func five(_ sender: Any) {
        update(var1: "5", var2: "5")
    }
    
    @IBAction func six(_ sender: Any) {
        update(var1: "6", var2: "6")
    }
    
    @IBAction func seven(_ sender: Any) {
        update(var1: "7", var2: "7")
    }
    
    @IBAction func eight(_ sender: Any) {
        update(var1: "8", var2: "8")
    }
    
    @IBAction func nine(_ sender: Any) {
        update(var1: "9", var2: "9")
    }
    
    @IBAction func equals(_ sender: Any){
        //Front-end error checking
        if !parser.largeNum.isEmpty{
            parser.stringToParse.append(parser.largeNum)
            parser.largeNum.removeAll()
        }
        if equationLabel.text == "y=" || equationLabel.text == "ERROR"{
            equationLabel.text = "ERROR"
        }else{
            data.displayString = equationLabel.text
            data.finalString = parser.stringToParse.joined()
            performSegue(withIdentifier: "GraphSegue", sender: self)
            print("pushed")
            clear()
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! GraphViewController
        destVC.data = self.data
       }
    
    
    
}





