//
//  ViewControllerPassword.swift
//  FingerPrintUnlock
//
//  Created by Sierra 4 on 13/04/17.
//  Copyright © 2017 Sierra 4. All rights reserved.
//

import UIKit

class ViewControllerPassword: UIViewController,UITextFieldDelegate,CAAnimationDelegate,customDelegates {
    @IBOutlet var img: UIImageView!
    @IBOutlet var txtEntries: [UITextField]!
    var Time:Timer?
    var isMoving = false
    var shouldStopMoving = false
    var str = Identifier.blank.identifier
    var saveStr = Identifier.blank.identifier
    var passwd = Identifier.pswd.identifier
    var timer: Timer!
    func textFieldDidChange(textField: UITextField){
        let text = textField.text
        if text?.utf16.count==1{
            switch textField{
            case txtEntries[0]:
                str = str+txtEntries[0].text!
                txtEntries[1].becomeFirstResponder()
                notify()
            case txtEntries[1]:
                str = str+txtEntries[1].text!
                txtEntries[2].becomeFirstResponder()
                notify()
            case txtEntries[2]:
                str = str+txtEntries[2].text!
                txtEntries[3].becomeFirstResponder()
                notify()
            case txtEntries[3]:
                str = str+txtEntries[3].text!
                txtEntries[3].resignFirstResponder()
                start()
                matchPasswords(stringEntered: str)
            default:
                break
            }
        }else{
            
        }
    }
    func start() {
        if self.isMoving == false {
            self.img.rotateImage(completionDelegate: self)
            self.isMoving = true
            
        }
    }
    func stop() {
        self.shouldStopMoving = true

    }
    func notify()
    {
        start()
        stop()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Identifier.PinSend.identifier
        {
            let vc:ViewControllerPin = segue.destination as! ViewControllerPin
            vc.delegate = self
        }
        
    }
    func matchPasswords(stringEntered:String)
    {
        if(str == passwd)
        {
            start()
            Time = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false, block: { (_) in
              self.clear()
               self.stop()
              self.performSegue(withIdentifier: Identifier.dataPass.identifier, sender: self)
            })
        }
        else{
            alertbox(_Message: Identifier.alertMsg.identifier, obj: self)
            clear()
            }
    }
    func clear()
    {
        for index in 0...3
        {
            txtEntries[index].text = Identifier.blank.identifier
        }

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        txtEntries[0].addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        txtEntries[1].addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        txtEntries[2].addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        txtEntries[3].addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
    }
    
    
    
    func SetPin(pin: String) {
         passwd = pin
          print(passwd)
        
    }
    @IBAction func btnBackAction(_ sender: UIButton) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(false)
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if self.shouldStopMoving == false {
            self.img.rotateImage(completionDelegate: self)
        } else {
            self.reset()
        }
    }
    
    func reset() {
        self.isMoving = false
        self.shouldStopMoving = false
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}



