//
//  BookDetailViewController.swift
//  BookStore
//
//  Created by Edgar Gerardo Flores Lopez on 20/09/21.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    private lazy var scrollView: GeneralScrollView = {
        let sView = GeneralScrollView()
        sView.translatesAutoresizingMaskIntoConstraints = false
        return sView
    }()

    private lazy var bookNameLabel: UILabel = {
        let pNameLabel = UILabel()
        pNameLabel.translatesAutoresizingMaskIntoConstraints = false
        pNameLabel.text = "Book \nName"
        pNameLabel.textAlignment = .center
        pNameLabel.font = UIFont.systemFont(ofSize: 20.0, weight: .bold)
        pNameLabel.numberOfLines = 0
        return pNameLabel
    }()

    private lazy var bookImageView: UIImageView = {
        let biView = UIImageView()
        biView.translatesAutoresizingMaskIntoConstraints = false
        biView.layer.cornerRadius = 10.0
        biView.contentMode = .scaleAspectFill
        biView.image = UIImage(named: "background")
        biView.layer.borderWidth = 1
        biView.layer.borderColor = UIColor(named: "softGrey")?.cgColor
        biView.clipsToBounds = true
        return biView
    }()
    
    private lazy var importationLabel: UILabel = {
        let iLabel = UILabel()
        iLabel.translatesAutoresizingMaskIntoConstraints = false
        iLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .semibold)
        iLabel.text = "IMPORTADO"
        iLabel.backgroundColor = UIColor(named: "softYellow")
        iLabel.layer.borderWidth = 1
        iLabel.layer.borderColor = UIColor(named: "softGrey")?.cgColor
        iLabel.textAlignment = .center
        return iLabel
    }()
    
    private lazy var stackView: UIStackView = {
        let sView = UIStackView()
        sView.translatesAutoresizingMaskIntoConstraints = false
        sView.axis = .vertical
        sView.distribution = .fill
        sView.spacing = 3.0
        return sView
    }()
    
    private lazy var authorLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.font = UIFont.systemFont(ofSize: 15.0, weight: .medium)
        aLabel.text = "Autor: "
        return aLabel
    }()
    
    private lazy var isbnLabel: UILabel = {
        let iLabel = UILabel()
        iLabel.translatesAutoresizingMaskIntoConstraints = false
        iLabel.font = UIFont.systemFont(ofSize: 15.0, weight: .medium)
        iLabel.text = "ISBN: "
        return iLabel
    }()
    
    private lazy var genreLabel: UILabel = {
        let gLabel = UILabel()
        gLabel.translatesAutoresizingMaskIntoConstraints = false
        gLabel.font = UIFont.systemFont(ofSize: 15.0, weight: .medium)
        gLabel.text = "Género: "
        return gLabel
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let dLabel = UILabel()
        dLabel.translatesAutoresizingMaskIntoConstraints = false
        dLabel.font = UIFont.systemFont(ofSize: 15.0, weight: .regular)
        dLabel.text = "Descripción: "
        dLabel.textAlignment = .justified
        dLabel.numberOfLines = 0
        return dLabel
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
    
    func configure(book: BookMapper) {
        bookNameLabel.text = book.title
        
        let url: URL? = URL(string: book.img)
        bookImageView.kf.setImage(with: url, placeholder: nil, options: [.transition(.fade(0.3))])
        
        if book.imported == true {
            importationLabel.isHidden = false
        } else {
            importationLabel.isHidden = true
        }
        
        authorLabel.text = "Autor: \(book.author)"
        switch book.genre {
        case "History":
            genreLabel.text = "Género: Historia"
        case "Science":
            genreLabel.text = "Género: Ciencia"
        case "Business":
            genreLabel.text = "Género: Negocios"
        default:
            return
        }
        
        isbnLabel.text = "ISBN: \(book.isbn)"
        descriptionLabel.text = book.description
    }
    
    func setupViewController() {
        view.backgroundColor = UIColor.white
        
        view.addSubview(scrollView)
        let cView = scrollView.containerView
        
        cView.addSubview(bookNameLabel)
        cView.addSubview(bookImageView)
        bookImageView.addSubview(importationLabel)
        cView.addSubview(stackView)
        stackView.addArrangedSubview(authorLabel)
        stackView.addArrangedSubview(genreLabel)
        stackView.addArrangedSubview(isbnLabel)
        cView.addSubview(descriptionLabel)
        
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        bookNameLabel.leadingAnchor.constraint(equalTo: cView.leadingAnchor, constant: 20.0).isActive = true
        bookNameLabel.topAnchor.constraint(equalTo: cView.topAnchor, constant: 60.0).isActive = true
        bookNameLabel.trailingAnchor.constraint(equalTo: cView.trailingAnchor, constant: -20.0).isActive = true
        
        bookImageView.topAnchor.constraint(equalTo: bookNameLabel.bottomAnchor, constant: 30.0).isActive = true
        bookImageView.centerXAnchor.constraint(equalTo: cView.centerXAnchor).isActive = true
        bookImageView.widthAnchor.constraint(equalTo: cView.widthAnchor, multiplier: 0.7).isActive = true
        bookImageView.heightAnchor.constraint(equalTo: bookImageView.widthAnchor, multiplier: 499/334).isActive = true
        
        importationLabel.leadingAnchor.constraint(equalTo: bookImageView.leadingAnchor).isActive = true
        importationLabel.trailingAnchor.constraint(equalTo: bookImageView.trailingAnchor).isActive = true
        importationLabel.bottomAnchor.constraint(equalTo: bookImageView.bottomAnchor).isActive = true
        importationLabel.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        
        stackView.leadingAnchor.constraint(equalTo: bookNameLabel.leadingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: bookImageView.bottomAnchor, constant: 20.0).isActive = true
        stackView.trailingAnchor.constraint(equalTo: bookNameLabel.trailingAnchor).isActive = true
    
        descriptionLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10.0).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: cView.bottomAnchor, constant: -40.0).isActive = true
    }
}
