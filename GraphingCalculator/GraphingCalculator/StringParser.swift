//
//  StringParser.swift
//  GraphingCalculator
//
//  Created by cstest on 12/14/17.
//  Copyright © 2017 asokol. All rights reserved.
//

class StringParser{
    var stringToParse: [String] = []
    var largeNum = ""
    var count = -1
    var test = ""
    let values = ["0" , "1" , "2" , "3" , "4" , "5" , "6" , "7" , "8" , "9"]
    
    func updateStrings(val1: String, val2: String){
        if !values.contains(val2) || val2 == largeNum{
            if !largeNum.isEmpty{
                stringToParse.append(largeNum)
                count+=1
                largeNum.removeAll()
            }
            stringToParse.append(val2)
            count+=1
        }else{
            largeNum.append(val2)
        }
    }
    
}

