//
//  ViewController.swift
//  AndersenCoreDataApp
//
//  Created by admin on 23.10.2019.
//  Copyright © 2019 Viacheslav Savitsky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         NotificationCenter.default.addObserver(self, selector: #selector(notificationData(_ :)), name: NSNotification.Name("NotificationTest"), object: nil)
    }

    @objc func notificationData(_ notification: Notification) {
        if let text = notification.userInfo?["textField"] {
            DispatchQueue.main.async {
                self.textLabel.text = text as? String
            }
        }
//        print(notification.userInfo?["textField"])
//        textLabel.text = notification.userInfo?["textField"] as! String
    }

}
