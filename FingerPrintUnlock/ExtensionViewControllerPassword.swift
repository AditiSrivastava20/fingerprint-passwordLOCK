//
//  ExtensionViewControllerPassword.swift
//  FingerPrintUnlock
//
//  Created by Sierra 4 on 14/04/17.
//  Copyright © 2017 Sierra 4. All rights reserved.
//

import Foundation
import UIKit
import LocalAuthentication

extension ViewControllerPassword:UITextFieldDelegate,CAAnimationDelegate
{
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
    func loadviewHere()
    {
        txtEntries[0].addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        txtEntries[1].addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        txtEntries[2].addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        txtEntries[3].addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
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
    func matchPasswords(stringEntered:String)
    {
        if(str == passwd)
        {
            start()
            Time = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false, block: { (_) in
                self.start()
                self.clear()
                self.stop()
                print(self.str)
                print(self.passwd)
                self.str = Identifier.blank.identifier
                self.performSegue(withIdentifier: Identifier.dataPass.identifier, sender: self)
            })
        }
        else{
            alertbox(_Message: Identifier.alertMsg.identifier, obj: self)
            stop()
            self.str = Identifier.blank.identifier
            print(str)
            print(passwd)
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
    func buttonActionOnTouch()
    {
        let authenticationContext = LAContext()
        var error:NSError?
        guard authenticationContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
            showAlertViewIfNoBiometricSensorHasBeenDetected()
            return
            
        }
        
        authenticationContext.evaluatePolicy(
            .deviceOwnerAuthenticationWithBiometrics,
            localizedReason: Identifier.reason.identifier,
            reply: { [unowned self] (success, error) -> Void in
                
                if( success ) {
                    
                    self.showAlertWithTitle(Identifier.WelcomeTitle.identifier, message: Identifier.welcome.identifier)
                    
                }else {
                    
                    
                    if let error = error {
                        
                        let message = self.errorMessageForLAErrorCode(error._code)
                        self.showAlertViewAfterEvaluatingPolicyWithMessage(message)
                        
                    }
                    
                }
                
        })

    }
    func showAlertViewIfNoBiometricSensorHasBeenDetected(){
        
        showAlertWithTitle(Identifier.error.identifier, message: Identifier.sensor.identifier)
        
    }
    
    func showAlertViewAfterEvaluatingPolicyWithMessage( _ message:String ){
        
        showAlertWithTitle(Identifier.error.identifier, message: message)
        
    }
    
    func showAlertWithTitle( _ title:String, message:String ) {
        
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: Identifier.ok.identifier, style: .default, handler: nil)
        alertVC.addAction(okAction)
        
        DispatchQueue.main.async { () -> Void in
            
            self.present(alertVC, animated: true, completion: nil)
            
        }
    }
    func errorMessageForLAErrorCode( _ errorCode:Int ) -> String{
        
        var message = Identifier.blank.identifier
        
        switch errorCode {
        case LAError.Code.appCancel.rawValue:
            message = Identifier.msg1.identifier
        case LAError.Code.authenticationFailed.rawValue:
            message = Identifier.msg2.identifier
        case LAError.Code.invalidContext.rawValue:
            message = Identifier.msg3.identifier
        case LAError.Code.passcodeNotSet.rawValue:
            message = Identifier.msg4.identifier
        case LAError.Code.systemCancel.rawValue:
            message = Identifier.msg1.identifier
        case LAError.Code.touchIDLockout.rawValue:
            message = Identifier.msg5.identifier
        case LAError.Code.touchIDNotAvailable.rawValue:
            message = Identifier.msg6.identifier
        case LAError.Code.userCancel.rawValue:
            message = Identifier.msg1.identifier
        case LAError.Code.userFallback.rawValue:
            message = Identifier.msg7.identifier
        default:
            message = Identifier.msg4.identifier
            
        }
        return message
        
    }

    
}
