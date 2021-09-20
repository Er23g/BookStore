//
//  GeneralViewController.swift
//  BookStore
//
//  Created by Edgar Gerardo Flores Lopez on 20/09/21.
//

import UIKit

class GeneralViewController: UIViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
    
    internal func setupViewController() {
        view.backgroundColor = UIColor.white
    }
}
