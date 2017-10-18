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
class ViewControllerPin: UIViewController{
    @IBOutlet var txtEntries: [UITextField]!
    var delegate:customDelegates?
    var str = Identifier.blank.identifier
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(false)
    }
    
    @IBAction func btnBackAction(_ sender: UIButton) {
       _ = self.navigationController?.popViewController(animated: true)
    }
        override func viewDidLoad() {
        super.viewDidLoad()
        loadviewHere()

    }
       override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }

} 
