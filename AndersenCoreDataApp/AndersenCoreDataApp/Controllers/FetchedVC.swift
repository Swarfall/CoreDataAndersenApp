//
//  FechedViewController.swift
//  AndersenCoreDataApp
//
//  Created by admin on 21.10.2019.
//  Copyright © 2019 Viacheslav Savitsky. All rights reserved.
//

import UIKit
import CoreData

class FetchedVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let persistentContainer = NSPersistentContainer(name: "Channel")
    var channelModel: [Channel] = []
    
    fileprivate lazy var fetchedResultsController: NSFetchedResultsController<Channel> = {
        
        let fetchedRequest: NSFetchRequest<Channel> = Channel.fetchRequest()
        
        fetchedRequest.sortDescriptors = [NSSortDescriptor(key: "nameChannel", ascending: true)]
        
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchedRequest, managedObjectContext: self.persistentContainer.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        
        fetchedResultsController.delegate = self
        
        return fetchedResultsController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        persistentContainer.loadPersistentStores { (persistentStoreDescription, error) in
            if let _ = error {
                print("Error: \(String(describing: error))")
            } else {
                self.tableView.reloadData()
            }
            
            do {
                try self.fetchedResultsController.performFetch()
            } catch {
                print("Error: \(error)")
            }
            self.tableView.reloadData()
        }
        
        tableView.register(UINib(nibName: "FetchedCell", bundle: nil), forCellReuseIdentifier: "FetchedCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    

}

extension FetchedVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let channels = fetchedResultsController.fetchedObjects else { return 0 }
        return channels.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return channelModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FetchedCell", for: indexPath) as! FetchedCell
        cell.update(channel: channelModel[indexPath.row])
        return cell
    }
}

extension FetchedVC: NSFetchedResultsControllerDelegate {
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
        
        tableView.reloadData()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type {
        case .insert:
            if let indexPath = newIndexPath {
            tableView.insertRows(at: [indexPath], with: .fade)
            }
            break
        default:
            print("default")
        }
    }
}
