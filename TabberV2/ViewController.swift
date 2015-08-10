//
//  ViewController.swift
//  tips
//
//  Created by Jessie Chen on 8/6/15.
//  Copyright © 2015 Jessie Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
   
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipsParenthesis: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var total2Label: UILabel!
    @IBOutlet weak var total3Label: UILabel!
    @IBOutlet weak var total4Label: UILabel!
    @IBOutlet weak var p1: UIImageView!
    @IBOutlet weak var p2: UIImageView!
    @IBOutlet weak var p3: UIImageView!
    @IBOutlet weak var p4: UIImageView!
    @IBOutlet weak var p5: UIImageView!
    @IBOutlet weak var p6: UIImageView!
    @IBOutlet weak var p7: UIImageView!
    @IBOutlet weak var p8: UIImageView!
    @IBOutlet weak var p9: UIImageView!
    @IBOutlet weak var p10: UIImageView!
    @IBOutlet weak var lightArea: UIView!
    @IBOutlet weak var darkArea: UIView!
    @IBOutlet weak var maxReachedLabel: UILabel!
    @IBOutlet weak var percentageSlider: UISlider!
    @IBOutlet weak var percentageLabel: UILabel!
    
    
    // override func viewWillAppear(animated: Bool) {
    //     navigationItem.title = "Tabber"
    // }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        total2Label.text = "$0.00"
        total3Label.text = "$0.00"
        total4Label.text = "$0.00"
        percentageLabel.text = "18%"
        lightArea.alpha = 1
        darkArea.alpha = 0
        //tipControl.hidden = true
        tipLabel.hidden = true
        tipsParenthesis.hidden = true
        percentageLabel.hidden = true
        maxReachedLabel.hidden = true
        
        
        billField.text = "$"
        
        billField.becomeFirstResponder()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    @IBAction func onEditingChanged(sender: AnyObject) {
        print(billField.text)
        
        maxReachedLabel.hidden = true
        
        if(billField.text?.characters.count > 0)
        {
            
            let a: Character = "$"
            let b: Character = (billField.text?.characters.first)!
            
            if(a == b){
                billField.text!.removeAtIndex(billField.text!.startIndex)
                if (self.darkArea.alpha == 0){
                    self.billField.center.y = self.billField.center.y - 70
                }
            }
            
            UIView.animateWithDuration(0.4, animations:{
                self.darkArea.alpha = 1
                self.tipLabel.hidden = false
                self.tipsParenthesis.hidden = false
                self.percentageLabel.hidden = false
                
            })
            
        }else {
            UIView.animateWithDuration(0.4, animations:{
                if (self.darkArea.alpha == 1){
                    self.billField.center.y = self.billField.center.y + 70
                }
                self.darkArea.alpha = 0
                //self.tipControl.hidden = true
                self.tipLabel.hidden = true
                self.tipsParenthesis.hidden = true
                self.percentageLabel.hidden = true
                self.billField.text = "$"
            })
            
        }
        
        
        //var tipPercentages = [0.18, 0.2, 0.22]
        //var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        //percentageLabel.text = String(format: "$%.2f", percentageSlider.value) + " %"
        percentageLabel.text = String(format: "%.2f", percentageSlider.value) + " %"
        
        print(percentageSlider.value)
        
        var tipPercentage = percentageSlider.value / 100
        
        print(tipPercentage)
        
        var billAmount = NSString(string: billField.text!).doubleValue
        //var billAmount = billField.text.bridgeToObjectiveC().doubleValue
        
        //Set max limit: = total + tip = $999999.99 at 30% tip
        if (billAmount > 769230.758){
            billAmount = 769230.758
            maxReachedLabel.hidden = false
        }
        
        var tip = billAmount * Double(tipPercentage)
        var total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        total2Label.text = "$\(total/2)"
        total3Label.text = "$\(total/3)"
        total4Label.text = "$\(total/4)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        total2Label.text = String(format: "$%.2f", total/2)
        total3Label.text = String(format: "$%.2f", total/3)
        total4Label.text = String(format: "$%.2f", total/4)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}