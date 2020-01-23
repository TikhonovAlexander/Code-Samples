//
//  ATHealthPromptsTableViewController.swift
//  ottonova
//
//  Created by atikhonov on 13/02/2019.
//  Copyright (c) 2019 atikhonov. All rights reserved.

import UIKit

protocol ATHealthPromptsDisplayLogic: AnyObject {
    func display(viewModel: ATHealthPromptsModel.FetchHealthPrompts.ViewModel, completion: (() -> Void)?)
}

class ATHealthPromptsCollectionViewController: UICollectionViewController {
    var interactor: ATHealthPromptsBusinessLogic?
    var router: (NSObjectProtocol & ATHealthPromptsRoutingLogic & ATHealthPromptsDataPassing)?
    
    var viewModel: ATHealthPromptsModel.FetchHealthPrompts.ViewModel
    
    lazy var emptyResultView: ATEmptyResultView? = {
        let emptyResultView = ATEmptyResultView.loadNibNamed(ofOwner: self)
        emptyResultView?.configure(title: "No configured")
        return emptyResultView
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
        let interactor = ATHealthPromptsInteractor()
        let presenter = ATHealthPromptsPresenter()
        let router = ATHealthPromptsRouter()
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
        prepareCollectionView()
    }
    
    private func prepareCollectionView() {
        if let healthPromptsCollectionLayout = collectionView.collectionViewLayout as? ATHealthPromptsCollectionLayout {
            healthPromptsCollectionLayout.itemSize = .init(width: 340, height: 200)
            healthPromptsCollectionLayout.spacingBetweenItems = 12.0
        }
    }
    
    func fetchHealthPrompts(profileId: String, completion: (() -> Void)?) {
        let request = ATHealthPromptsModel.FetchHealthPrompts.FetchAllRequest(profileId: profileId)
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

extension ATHealthPromptsCollectionViewController: ATHealthPromptsDisplayLogic {
    func display(viewModel: ATHealthPromptsModel.FetchHealthPrompts.ViewModel, completion: (() -> Void)?) {
        defer { completion?() }
        self.viewModel = viewModel
        switch viewModel.state {
        case .result:
            endAnimating()
            collectionView.backgroundView = nil
            collectionView.reloadData()
        case .emptyResult(let title, _):
            endAnimating()
            emptyResultView?.configure(title: title)
            collectionView.backgroundView = emptyResultView
            collectionView.reloadData()
        case .loading:
            startAnimating()
            collectionView.backgroundView = activityView
            collectionView.reloadData()
        case .error(let message):
            endAnimating()
            showAlert(with: message)
        }
    }
}

extension ATHealthPromptsCollectionViewController {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        guard case .result = viewModel.state else { return 0 }
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard case let .result(models) = viewModel.state else { return 0 }
        return models.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard case let .result(models) = viewModel.state else { preconditionFailure("Wrong state: \(viewModel.state) in cellForItemAt \(indexPath)") }
        let model = models[indexPath.row]
        let cell = collectionView.dequeueReusableCell(model: model, indexPath: indexPath)
        return model.configure(cell: cell, at: indexPath, in: collectionView)
        
    }
}
