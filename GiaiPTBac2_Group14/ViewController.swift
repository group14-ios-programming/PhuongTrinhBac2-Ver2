//
//  ViewController.swift
//  GiaiPTBac2_Group14
//
//  Created by Hung Huu Hoang on 5/11/18.
//  Copyright © 2018 hcmute. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet var txtA: UITextField!
    
    @IBOutlet var txtB: UITextField!
    
    @IBOutlet var txtC: UITextField!
    
    @IBOutlet var btnGiai: UIButton!
    
    @IBOutlet var btnReset: UIButton!
    
    @IBOutlet var lblKQ: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //lblKQ.isHidden = true
        txtA.delegate = self
        txtB.delegate = self
        txtC.delegate = self
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        let aSet = NSCharacterSet(charactersIn: "0123456789.-").inverted
        let cursor=range.location
        let compSepByCharInSet = string.components(separatedBy: aSet)
        if ((textField.text?.contains("."))! && compSepByCharInSet[0] == ".") ||
            ((textField.text?.contains("-"))! && compSepByCharInSet[0] == "-") ||
            (cursor==0 && compSepByCharInSet[0] == ".") || (cursor != 0 && compSepByCharInSet[0] == "-")
        {
            
            return false
            
        }
        let numberFiltered = compSepByCharInSet.joined(separator: "")
        return string == numberFiltered
        
        
    }
   /*
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        let aSet = NSCharacterSet(charactersIn: "0123456789.-").inverted
        let compSepByCharInSet = string.components(separatedBy: aSet)
        let numberFiltered = compSepByCharInSet.joined(separator: "")
        return string == numberFiltered
    }
    */
    @IBAction func click(_ sender: Any) {
        
        
        
        //lblKQ.text = ""
        //lblKQ.isHidden = true
        
        
        if(txtA.text! == "" || txtB.text! == "" || txtC.text! == "")
        {
            lblKQ.text = "Chưa nhập hệ số, vui lòng nhập lại!"
            lblKQ.isHidden = false
        }
        else
        {
            if (txtA.text! == "-" || txtB.text! == "-" || txtC.text! == "-")
            {
                lblKQ.text = "Dữ liệu sai, vui lòng nhập lại!"
            }
            else
            {
                let a:Double = (Double)(txtA.text!)!
                let b:Double = (Double)(txtB.text!)!
                let c:Double = (Double)(txtC.text!)!
                
                var D:Double
                var x1:Double
                var x2:Double
                if(a==0)
                {
                    if(b==0)
                    {
                        if(c==0)
                        {
                            lblKQ.text = "Phương trình có vô số nghiệm!"
                        }
                        else
                        {
                            lblKQ.text = "Phương trình vô nghiệm!"
                        }
                    }
                    else
                    {
                        lblKQ.text = "Phương trình có nghiệm duy nhất:\n x = \(-c/b)"
                    }
                }
                else
                {
                    D = b*b - 4*a*c
                    if (D < 0)
                    {
                        lblKQ.text = "Phương trình vô nghiệm!"
                    }
                    else
                    {
                        if (D == 0)
                        {
                            lblKQ.text = "Phương trình có nghiệm kép:\nx1 = x2 = \(-b/(2*a))"
                        }
                        else
                        {
                            x1 = (-b + sqrt(D))/(2*a)
                            x2 = (-b - sqrt(D))/(2*a)
                            lblKQ.text = "Phương trình có hai nghiệm phân biệt:\n x1 = \(x1)\n x2 = \(x2)"
                        }
                    }
                }
                
            }

        }
            
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //reset cac o text
    @IBAction func btnResetAction(_ sender: Any) {
        txtA.text = ""
        txtB.text = ""
        txtC.text = ""
        lblKQ.text = ""
    }
}

