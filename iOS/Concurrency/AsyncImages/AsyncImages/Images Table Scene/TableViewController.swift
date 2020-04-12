//
//  TableViewController.swift
//  AsyncImages
//
//  Created by tikhonov on 11.04.20.
//  Copyright © 2020 tikhonov. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    private var urls: [URL] = []
    private var queue: OperationQueue = OperationQueue()
    
    private var operations: [IndexPath: [Operation]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableView.automaticDimension
        populateURLs()
    }
    
    @IBAction func cancelAllTapped() {
        queue.cancelAllOperations()
    }
    
    private func populateURLs() {
        guard let plist = Bundle.main.url(forResource: "Photos", withExtension: "plist"),
            let contents = try? Data(contentsOf: plist),
            let serial = try? PropertyListSerialization.propertyList(from: contents, format: nil),
            let serialUrls = serial as? [String] else {
                print("Something went wrong!")
                return
        }
        
        urls = serialUrls.compactMap(URL.init)
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        urls.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as! ImageCell
        
        let url = urls[indexPath.row]
        let downloadOperation = DownloadImageOperation(url: url)
        let tiltOperation = TiltShiftOperation()
        tiltOperation.addDependency(downloadOperation)
        cell.show(image: nil)
        cell.isLoading = true
        
        tiltOperation.onImageProcessed = { image in
            guard let cell = tableView.cellForRow(at: indexPath) as? ImageCell
                else { return }
            cell.isLoading = false
            cell.show(image: image)
        }
        
        queue.addOperation(downloadOperation)
        queue.addOperation(tiltOperation)
        
        operations[indexPath]?.forEach { $0.cancel() }
        operations[indexPath] = [tiltOperation, downloadOperation]
        
        return cell
    }
    
    override func tableView( _ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        operations[indexPath]?.forEach { $0.cancel() }
    }
    
    deinit {
        print("deinit TableViewController")
    }
}
