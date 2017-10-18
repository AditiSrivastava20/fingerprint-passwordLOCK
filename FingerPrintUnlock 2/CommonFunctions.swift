//
//  CommonFunctions.swift
//  Task16March
//
//  Created by Sierra 4 on 17/03/17.
//  Copyright © 2017 Sierra 4. All rights reserved.

import Foundation
import UIKit

 func alertbox(_Message:String,obj:UIViewController)
{
    let alertmsg=UIAlertController(title: Identifier.Alert.identifier, message: _Message, preferredStyle: UIAlertControllerStyle.alert)
    let OkAction=UIAlertAction(title: Identifier.ok.identifier, style: UIAlertActionStyle.default, handler: { (action: UIAlertAction!) in
        
    })
    alertmsg.addAction(OkAction)
    obj.present(alertmsg,animated:true,completion: nil)


}
extension UIView{
func rotateImage(_ duration: CFTimeInterval = 1.0, completionDelegate: CAAnimationDelegate? = nil) {
    let rotateAnimation = CABasicAnimation(keyPath:Identifier.rotation.identifier)
    rotateAnimation.fromValue = 0.0
    rotateAnimation.toValue = CGFloat(M_PI * 1.0)
    rotateAnimation.duration = duration
    if let delegate: CAAnimationDelegate = completionDelegate {
        rotateAnimation.delegate = delegate
    }
    self.layer.add(rotateAnimation, forKey: nil)
}
}
