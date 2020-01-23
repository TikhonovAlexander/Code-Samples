//
//  ATDetailTableViewController.swift
//  ottonova
//
//  Created by atikhonov on 13/02/2019.
//  Copyright (c) 2019 atikhonov. All rights reserved.

import UIKit

protocol ATDetailDisplayLogic: AnyObject {
    func display(viewModel: ATDetailModel.FetchDetail.ViewModel, completion: (() -> Void)?)
}

class ATDetailViewController: UIViewController {
    var interactor: ATDetailBusinessLogic?
    var router: (NSObjectProtocol & ATDetailRoutingLogic & ATDetailDataPassing)?
    
    @IBOutlet var nameLabel: UILabel!
    
    var viewModel: ATDetailModel.FetchDetail.ViewModel
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        viewModel = .init(state: .result(name: "Initial state"))
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        viewModel = .init(state: .result(name: "Initial state"))
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = ATDetailInteractor()
        let presenter = ATDetailPresenter()
        let router = ATDetailRouter()
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
    
    private func prepareViewController() {
        title = "Timeline"
        interactor?.fetch(request: ATDetailModel.FetchDetail.FetchDetailRequest(), completion: nil)
    }
    
}

// MARK: Display logic

extension ATDetailViewController: ATDetailDisplayLogic {
    func display(viewModel: ATDetailModel.FetchDetail.ViewModel, completion: (() -> Void)?) {
        defer { completion?() }
        if case .result(let name) = viewModel.state {
            nameLabel.text = name
        }
    }
}
