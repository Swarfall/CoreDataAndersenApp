//
//  ColorViewController.swift
//  AndersenCoreDataApp
//
//  Created by admin on 23.10.2019.
//  Copyright © 2019 Viacheslav Savitsky. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var textTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    @IBAction func didTapSave(_ sender: Any) {
         NotificationCenter.default.post(name: Notification.Name("NotificationTest"), object: nil, userInfo: ["textField": textTextField.text ?? ""])
    }
}
