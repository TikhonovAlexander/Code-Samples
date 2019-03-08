//
//  ViewController.swift
//  loadView
//
//  Created by atikhonov on 07.03.19.
//  Copyright © 2019 atikhonov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func action(_ sender: Any) {
        
//      Load from LoadedViewController.xib in main bundle
//        let vc = LoadedViewController(nibName: "LoadedViewController", bundle: .main)
        
//        Default to main bundle
//        let vc = LoadedViewController(nibName: "LoadedViewController", bundle: nil)
        
//        If you don’t set the nibName, loadView() searches for a file using the name of the view controller class. For example, if our view controller class is LoadedViewController it tries in this order:
//        • LoadedView.nib - this only works for classes that end in Controller.
//        • LoadedViewController.nib
        
//        The following are equivalent
//        let vc = LoadedViewController(nibName: nil, bundle: nil)
        let vc = LoadedViewController()
        
        present(vc, animated: true, completion: nil)
    }
    
}

