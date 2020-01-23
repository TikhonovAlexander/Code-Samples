//
//  ATTimelineTableViewController.swift
//  ottonova
//
//  Created by atikhonov on 13/02/2019.
//  Copyright (c) 2019 atikhonov. All rights reserved.

import UIKit

protocol ATTimelineDisplayLogic: AnyObject {
    func display(viewModel: ATTimelineModel.FetchTimelines.ViewModel, completion: (() -> Void)?)
}

class ATTimelineTableViewController: UITableViewController {
    var interactor: ATTimelineBusinessLogic?
    var router: (NSObjectProtocol & ATTimelineRoutingLogic & ATTimelineDataPassing)?
    
    var viewModel: ATTimelineModel.FetchTimelines.ViewModel
    
    lazy var emptyResultView: ATEmptyResultView? = {
        let TimelineEmptyResultView = ATEmptyResultView.loadNibNamed(ofOwner: self)
        TimelineEmptyResultView?.configure(title: "No configured")
        return TimelineEmptyResultView
    }()
    
    lazy var activityView: UIActivityIndicatorView? = {
        let activity = UIActivityIndicatorView(style: .whiteLarge)
        activity.color = .darkGray
        return activity
    }()
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        viewModel = .init(state: .loading)
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        viewModel = .init(state: .loading)
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = ATTimelineInteractor()
        let presenter = ATTimelinePresenter()
        let router = ATTimelineRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareViewController()
    }
    
    // MARK: Methods

    private func startAnimating() {
        activityView?.startAnimating()
    }
    
    private func endAnimating() {
        activityView?.stopAnimating()
    }
    
    private func prepareViewController() {
        prepareTableView()
    }
    
    private func prepareTableView() {
        tableView.register(nibModels: [ATTimelineTableViewCellModel.self])
        tableView.estimatedRowHeight = 0.0
        tableView.rowHeight = 60.0
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    
    func fetchTimelines(profileId: String, completion: (() -> Void)?) {
        let request = ATTimelineModel.FetchTimelines.FetchAllRequest(profileId: profileId)
        interactor?.fetch(request: request, completion: completion)
    }
    
    private func showAlert(with message: String) {
        let alertCoontroller = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertCoontroller.addAction(action)
        present(alertCoontroller, animated: true, completion: nil)
    }
}

// MARK: Display logic

extension ATTimelineTableViewController: ATTimelineDisplayLogic {
    func display(viewModel: ATTimelineModel.FetchTimelines.ViewModel, completion: (() -> Void)?) {
        defer { completion?() }
        self.viewModel = viewModel
        switch viewModel.state {
        case .result:
            tableView.backgroundView = nil
            endAnimating()
            tableView.reloadData()
        case .emptyResult(let title, _):
            endAnimating()
            emptyResultView?.configure(title: title)
            tableView.backgroundView = emptyResultView
            tableView.reloadData()
        case .loading:
            startAnimating()
            tableView.backgroundView = activityView
            tableView.reloadData()
        case .error(let message):
            endAnimating()
            tableView.backgroundView = nil
            showAlert(with: message)
        }
    }
}

extension ATTimelineTableViewController {
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard case .result(let sections) = viewModel.state else { return nil }
        let section = sections[section]
        return section.sectionTitle
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        guard case .result(let sections) = viewModel.state else { return 0 }
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard case .result(let sections) = viewModel.state else { return 0 }
        let section = sections[section]
        return section.cells.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard case .result(let sections) = viewModel.state else { preconditionFailure("Wrong state: \(viewModel.state) in cellForRowAtIndexPath \(indexPath)") }
        let section = sections[indexPath.section]
        let model = section.cells[indexPath.row]
        let cell = tableView.dequeueReusableCell(model: model, indexPath: indexPath)
        return model.configure(cell: cell, at: indexPath, in: tableView)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        interactor?.selectedTimeline(at: indexPath)
        router?.routeToDetail()
    }
}
