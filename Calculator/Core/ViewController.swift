
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    var isFinishTyping : Bool = true
    private  var cal = CalculatorController()

    private var dislayValue : Double {
        
        get {
            guard let currentNumber = Double(displayLabel.text!) else {
                fatalError("Here is the problm")
            }
            return currentNumber
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishTyping = true
        cal.setNumber(dislayValue)
        guard let newNumber = cal.getSuitableAnswer(sender) else {  return }
        dislayValue = newNumber
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        
        if let textLabel = sender.currentTitle {
            if isFinishTyping {
                displayLabel.text  = textLabel
                isFinishTyping = false
            } else {
                if textLabel == "." {
                 let isInt = floor(dislayValue) == dislayValue
                    
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + textLabel
            }
        }
        
    }

}

