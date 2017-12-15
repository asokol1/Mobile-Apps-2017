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
        equationLabel.text.removeAll()
        parser.stringToParse.removeAll()
        parser.largeNum.removeAll()
        parser.test.removeAll()
        parser.count = -1
        data.finalString.removeAll()
    }
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
        if parser.stringToParse.isEmpty && parser.largeNum.isEmpty{
            equationLabel.text = "ERROR"
        }
        else if !parser.largeNum.isEmpty{
            parser.test = parser.largeNum
            update(var1: "^(", var2: "pow(\(parser.test),")
            parser.stringToParse.remove(at: parser.count-1)
            parser.count-=1
        }
        else if parser.stringToParse[parser.count] == "x"{
            parser.test = "x"
            update(var1: "^(", var2: "pow(\(parser.test),")
            parser.stringToParse.remove(at: parser.count-1)
            parser.count-=1
        }
        else{equationLabel.text = "ERROR"}
    }
    
    @IBAction func sqrt(_ sender: Any) {
        update(var1: "√", var2: "pow(\(parser.test),")
        
    }
    @IBAction func pi(_ sender: Any) {
        update(var1: "^(", var2: "sqrt(")
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
        if !parser.largeNum.isEmpty{
            parser.stringToParse.append(parser.largeNum)
            parser.largeNum.removeAll()
        }
        data.finalString = parser.stringToParse.joined()
        performSegue(withIdentifier: "GraphSegue", sender: self)
        print("pushed")
        
        clear()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! GraphViewController
        destVC.data = self.data
       }
    
    
    
}





