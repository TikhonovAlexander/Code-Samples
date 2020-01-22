//
//  FeedsViewController.swift
//  Coordinator pattern
//
//  Created by atikhonov on 08.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import UIKit

class FeedsViewController: UIViewController, FeedListView {
    
    @IBOutlet var tableView: UITableView!
    
    var onFeedSelect: ((Feed) -> Void)?
    var onCreateFeed: (() -> Void)?
    
    private var feeds: [Feed] = {
        (0...10).map { Feed(name: "Feed \($0)", description: "Description") }
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Feeds"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItemButtonClicked(_:)))
    }
    
    @objc func addItemButtonClicked(_ sender: UIBarButtonItem) { onCreateFeed?() }
    
    deinit {
        print("deinit FeedsViewController")
    }
    
}

extension FeedsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        feeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let feed = feeds[indexPath.row]
        cell.textLabel?.text = feed.name
        cell.detailTextLabel?.text = feed.description
        return cell
    }
}

extension FeedsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let feed = feeds[indexPath.row]
        onFeedSelect?(feed)
    }
}
