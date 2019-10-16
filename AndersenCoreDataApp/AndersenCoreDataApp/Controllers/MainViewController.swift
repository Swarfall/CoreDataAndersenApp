//
//  ViewController.swift
//  AndersenCoreDataApp
//
//  Created by admin on 15.10.2019.
//  Copyright © 2019 Viacheslav Savitsky. All rights reserved.
//

import UIKit
import CoreData

class MainViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameChannelTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func didTapSubscribeButton(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newChannel = NSEntityDescription.insertNewObject(forEntityName: "Channel", into: context)
        newChannel.setValue(nameChannelTextField.text, forKey: "nameChannel")
        
        let image = UIImage(named: "greyYT")
        let dataImage = image?.pngData()
        newChannel.setValue(dataImage!, forKey: "logoChannel")
        
        do {
            try context.save()
            print("Context save")
        } catch {
            print("Error")
        }
        
    }
    
    @IBAction func didTapGoToListVCButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

