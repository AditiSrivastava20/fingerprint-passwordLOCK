//
//  ExtensionViewControllerPin.swift
//  FingerPrintUnlock
//
//  Created by Sierra 4 on 14/04/17.
//  Copyright © 2017 Sierra 4. All rights reserved.
//

import Foundation
import UIKit

extension ViewControllerPin:CAAnimationDelegate
{
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
    func loadviewHere()
    {
        txtEntries[0].addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        txtEntries[1].addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        txtEntries[2].addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        txtEntries[3].addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
    }

}
