//
//  SplashScreenViewController.swift
//  BookStore
//
//  Created by Edgar Gerardo Flores Lopez on 19/09/21.
//

import UIKit

class SplashScreenViewController: UIViewController {
    
    internal let screenSize: CGRect = UIScreen.main.bounds

    private lazy var imageView: UIImageView = {
        let iView = UIImageView()
        iView.translatesAutoresizingMaskIntoConstraints = false
        iView.contentMode = .scaleAspectFit
        iView.image = UIImage(named: "logo")
        iView.alpha = 0.0
        return iView
    }()
    
    private lazy var backgroundImageView: UIImageView = {
        let iView = UIImageView()
        iView.translatesAutoresizingMaskIntoConstraints = false
        iView.contentMode = .scaleAspectFill
        iView.image = UIImage(named: "background")
        return iView
    }()
        
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupController()
        
        let originalTransform = self.imageView.transform
        let scaledTransform = originalTransform.scaledBy(x: 1.7, y: 1.7)
                
        UIView.animate(withDuration: 1.3, animations: {
            self.imageView.alpha = 1.0
            self.imageView.transform = scaledTransform
        })
                
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(floatLiteral: 90/30), execute: {
            self.switchToMain()
        })

    }
        
    func setupController() {
        view.backgroundColor = UIColor(named: "white")
        
        view.addSubview(backgroundImageView)
        view.addSubview(imageView)

        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor,
                                         multiplier: 245.0 / 138.0).isActive = true
        
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

    }
}
