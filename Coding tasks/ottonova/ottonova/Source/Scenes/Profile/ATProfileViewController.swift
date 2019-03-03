//
//  ATProfileTableViewController.swift
//  ottonova
//
//  Created by atikhonov on 13/02/2019.
//  Copyright (c) 2019 atikhonov. All rights reserved.

import UIKit

protocol ATProfileDisplayLogic: AnyObject {
    func display(viewModel: ATProfileModel.FetchProfile.ViewModel, completion: (() -> Void)?)
}

class ATProfileViewController: UIViewController {
    var interactor: ATProfileBusinessLogic?
    var router: (NSObjectProtocol & ATProfileRoutingLogic & ATProfileDataPassing)?
    
    @IBOutlet var activityView: UIActivityIndicatorView!
    
    var viewModel: ATProfileModel.FetchProfile.ViewModel
    
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
        let interactor = ATProfileInteractor()
        let presenter = ATProfilePresenter()
        let router = ATProfileRouter()
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
        title = "Events"
        fetchProfile {
            self.fetchPromtsAndEvents()
        }
    }
    
    private func fetchPromtsAndEvents() {
        router?.passingToHealthPrompts()
    }
    
    private func fetchProfile(completion: (() -> Void)?) {
        let request = ATProfileModel.FetchProfile.FetchProfileRequest()
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

extension ATProfileViewController: ATProfileDisplayLogic {
    func display(viewModel: ATProfileModel.FetchProfile.ViewModel, completion: (() -> Void)?) {
        defer { completion?() }
        self.viewModel = viewModel
        switch viewModel.state {
        case .result:
            endAnimating()
        case .loading:
            startAnimating()
        case .error(let message):
            endAnimating()
            showAlert(with: message)
        }
    }
}
