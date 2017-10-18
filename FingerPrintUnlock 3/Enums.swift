//
//  Enums.swift
//  FingerPrintUnlock
//
//  Created by Sierra 4 on 13/04/17.
//  Copyright © 2017 Sierra 4. All rights reserved.
//

import Foundation
enum Identifier : String{
    case reason = "Only awesome people are allowed"
    case error = "Error"
    case welcome = "Welcome Here"
    case sensor = "sensor"
    case ok = "Ok"
    case msg1 = "Authentication was cancelled by application"
    case msg2 = "The user failed to provide valid credentials"
    case msg3 = "The context is invalid"
    case msg4 = "Passcode is not set on the device"
    case msg5 = "Too many failed attempts."
    case msg6 = "TouchID is not available on the device"
    case msg7 = "The user chose to use the fallback"
    case blank = ""
    case alertMsg = "Wrong Password.. Try Again"
    case dataPass = "dataPass"
    case pswd = "1234"
    case rotation = "transform.rotation"
    case Alert = "Alert"
    case pin = "Pin"
    case PinSend = "PinSend"
    var identifier : String{
        return self.rawValue
    }
}
enum heights:Int{
    case exp = 169
    case def = 44
    case exp2 = 150
}
