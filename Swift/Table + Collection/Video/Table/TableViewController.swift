//
//  ViewController.swift
//  Video
//
//  Created by atikhonov on 22.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {
    
    var coreDataStack: CoreDataStack!
    
    lazy var fetchedResultsController: NSFetchedResultsController<Video> = {
        let fetchRequest: NSFetchRequest<Video> = Video.fetchRequest()
        let nameSort = NSSortDescriptor(key: #keyPath(Video.videoName), ascending: true)
        fetchRequest.sortDescriptors = [nameSort]
        
        let fetchedResultsController = NSFetchedResultsController.init(fetchRequest: fetchRequest, managedObjectContext: coreDataStack.managedContext, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultsController.delegate = self
        return fetchedResultsController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 150
        do {
            try fetchedResultsController.performFetch()
        } catch let error as NSError {
            print("Fetching error: \(error), \(error.userInfo)")
        }
        
        loadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sectionInfo = fetchedResultsController.sections?[section] else { return 0 }
        return sectionInfo.numberOfObjects
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        configure(cell: cell, for: indexPath)
        return cell
    }
    
    func configure(cell: UITableViewCell, for indexPath: IndexPath) {
        let video = fetchedResultsController.object(at: indexPath)
        
        let tableCell = cell as! TableViewCell
        let imageName = video.videoName!
        tableCell.setImageName(imageName: imageName)
    }
    
    private func loadData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let video = Video(context: self.coreDataStack.managedContext)
            video.videoName = "insta"
            self.coreDataStack.saveContext()
        }
    }
}

extension TableViewController: NSFetchedResultsControllerDelegate {
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            tableView.insertRows(at: [newIndexPath!], with: .automatic)
        case .delete:
            tableView.deleteRows(at: [indexPath!], with: .automatic)
        case .update:
            let cell = tableView.cellForRow(at: indexPath!)!
            configure(cell: cell, for: indexPath!)
        case .move:
            tableView.deleteRows(at: [indexPath!], with: .automatic)
            tableView.insertRows(at: [newIndexPath!], with: .automatic)
        @unknown default:
            fatalError()
        }
    }
}
