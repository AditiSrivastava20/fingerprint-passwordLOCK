//
//  ViewControllerWelcome.swift
//  FingerPrintUnlock
//
//  Created by Sierra 4 on 13/04/17.
//  Copyright © 2017 Sierra 4. All rights reserved.
//

import UIKit

class ViewControllerWelcome: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnBackAction(_ sender: UIButton) {
        _ = self.navigationController?.popViewController(animated: true)
    }


}
