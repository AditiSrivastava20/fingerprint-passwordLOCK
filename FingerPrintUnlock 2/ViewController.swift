//
//  ViewController.swift
//  FingerPrintUnlock
//
//  Created by Sierra 4 on 12/04/17.
//  Copyright © 2017 Sierra 4. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func TouchAction(_ sender: UIButton) {
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
                    
                    self.showAlertWithTitle(Identifier.error.identifier, message: Identifier.welcome.identifier)
                    
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
