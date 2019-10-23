//
//  DefaultsViewController.swift
//  AndersenCoreDataApp
//
//  Created by admin on 23.10.2019.
//  Copyright © 2019 Viacheslav Savitsky. All rights reserved.
//

import UIKit

class DefaultsViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var textTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let someText = UserDefaults.standard.string(forKey: "text")
        textLabel.text = someText
    }
    
    @IBAction func didTapSaveButton(_ sender: Any) {
        UserDefaults.standard.set(textTextField.text, forKey: "text")
    }
    
  

}
