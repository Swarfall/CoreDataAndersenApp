//
//  ListViewController.swift
//  AndersenCoreDataApp
//
//  Created by admin on 15.10.2019.
//  Copyright © 2019 Viacheslav Savitsky. All rights reserved.
//

import UIKit
import CoreData

class ListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var channelModel: [ChannalModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "ChannelCell", bundle: nil), forCellReuseIdentifier: "ChannelCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Channel")
        request.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(request)
            
            if results.count > 0 {
                for r in results as! [NSManagedObject] {
                    
                    guard let name = r.value(forKey: "nameChannel") as? String else { return }
                    guard let image = r.value(forKey: "logoChannel") as? Data else { return }
                    
                    let channel = ChannalModel()
                    
                    channel.nameChannel = name
                    channel.logoImage = UIImage(data: image)
                    
                    channelModel.append(channel)
                }
            }
        } catch {
            print("ERROR")
        }
    }
    
    @IBAction func didTapGoToPopVCButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return channelModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChannelCell", for: indexPath) as! ChannelCell
        cell.update(channel: channelModel[indexPath.row])
        return cell
    }
}
