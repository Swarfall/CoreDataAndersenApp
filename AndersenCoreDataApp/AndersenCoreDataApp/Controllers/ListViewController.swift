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
    
    var channelModel: [Channel] = []
    
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
        
        let request = Channel.fetchRequest
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
        cell.index = indexPath.row
        cell.delegate = self
        cell.update(channel: channelModel[indexPath.row])
        return cell
    }
}

extension ListViewController: ChannelCellDelegate {
    
    func deleteChannel(index: Int) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let requestDel = NSFetchRequest<NSFetchRequestResult>(entityName: Channel)
        requestDel.returnsObjectsAsFaults = false
        
        do {
            let result = try context.fetch(requestDel)
            context.delete(result[index] as! NSManagedObject)
            DispatchQueue.main.async {
                tableView.reloadData()
            }
        } catch {
            print("Error: \(error)")
        }
        
        do {
            try context.save()
        } catch {
            print("Error: \(error)")
        }
    }
}
