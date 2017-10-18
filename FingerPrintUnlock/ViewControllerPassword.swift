//
//  ViewControllerPassword.swift
//  FingerPrintUnlock
//
//  Created by Sierra 4 on 13/04/17.
//  Copyright © 2017 Sierra 4. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewControllerPassword: UIViewController{
    @IBOutlet var img: UIImageView!
    @IBOutlet var txtEntries: [UITextField]!
    var Time:Timer?
    var isMoving = false
    var shouldStopMoving = false
    var str = Identifier.blank.identifier
    var saveStr = Identifier.blank.identifier
    var passwd = Identifier.pswd.identifier
    var timer: Timer!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadviewHere()
        buttonActionOnTouch()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(false)
    }
    
}



