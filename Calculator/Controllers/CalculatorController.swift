//
//  CalculatorController.swift
//  Calculator
//
//  Created by Mohammad Haris Sofi on 18/03/24.
//  Copyright © 2024 London App Brewery. All rights reserved.
//
 import UIKit

struct CalculatorController  {
    
    private var number : Double?
    
    private var intermediateCalculation: (n1 : Double , calcMethod : String)?
    
   mutating func setNumber (_ number : Double ) {
        self.number = number
    }
  
   mutating func getSuitableAnswer(_ sender : UIButton) -> Double? {
        if let  symbol = sender.currentTitle ,
           let number = self.number
        {
            if symbol == "+/-" {
                
               return number * -1
            }else if symbol == "%" {
           
               return number * 0.01
            } else if symbol == "AC" {
               return 0
            } else if symbol == "=" {
              return  perform2Calculation(n2: number)
            } else  {
               intermediateCalculation = (n1 : number , calcMethod : symbol)
             }
        }
        return nil
    }
    
  private  func perform2Calculation (n2 : Double) -> Double? {
        
      if let n1 = intermediateCalculation?.n1 ,
         let operation = intermediateCalculation?.calcMethod {
          switch operation {
          case "+" :
              return n1 + n2
          case "-" :
              return n1 - n2
          case "÷" :
              return n1 / n2
          case  "×" :
              return n1 * n2
          default :
              return 0
          }
      }
      return nil
    }
}
