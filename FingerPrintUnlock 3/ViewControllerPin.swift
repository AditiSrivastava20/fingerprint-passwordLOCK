//
//  ViewControllerPin.swift
//  FingerPrintUnlock
//
//  Created by Sierra 4 on 13/04/17.
//  Copyright © 2017 Sierra 4. All rights reserved.
//

import UIKit
protocol customDelegates
{
    func SetPin(pin:String)
}
class ViewControllerPin: UIViewController,CAAnimationDelegate {
    @IBOutlet var txtEntries: [UITextField]!
    var delegate:customDelegates?
    var str = Identifier.blank.identifier
    func textFieldDidChange(textField: UITextField){
        let text = textField.text
        if text?.utf16.count==1{
            switch textField{
            case txtEntries[0]:
                str = str+txtEntries[0].text!
                txtEntries[1].becomeFirstResponder()
            case txtEntries[1]:
                str = str+txtEntries[1].text!
                txtEntries[2].becomeFirstResponder()
            case txtEntries[2]:
                str = str+txtEntries[2].text!
                txtEntries[3].becomeFirstResponder()
            case txtEntries[3]:
                str = str+txtEntries[3].text!
                print(str)
                txtEntries[3].resignFirstResponder()
                delegate?.SetPin(pin: str)
            default:
                break
            }
        }else{
            
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(false)
    }
    
    @IBAction func btnBackAction(_ sender: UIButton) {
       _ = self.navigationController?.popViewController(animated: true)
    }
        override func viewDidLoad() {
        super.viewDidLoad()
            txtEntries[0].addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
            txtEntries[1].addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
            txtEntries[2].addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
            txtEntries[3].addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)

    }

       override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }

} 
