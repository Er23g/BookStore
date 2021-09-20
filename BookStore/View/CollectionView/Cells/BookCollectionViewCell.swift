//
//  BookView.swift
//  BookStore
//
//  Created by Edgar Gerardo Flores Lopez on 20/09/21.
//

import UIKit
import Kingfisher

class BookCollectionViewCell: UICollectionViewCell {
    
    static let cellName: String = "bookCollectionViewCell"
    
    private lazy var bookImageView: UIImageView = {
        let hiView = UIImageView()
        hiView.translatesAutoresizingMaskIntoConstraints = false
        hiView.backgroundColor = UIColor(named: "darkGrey")
        hiView.contentMode = .scaleAspectFill
        hiView.layer.borderWidth = 0.7
        hiView.layer.borderColor = UIColor(named: "softGrey")?.cgColor
        hiView.clipsToBounds = true
        return hiView
    }()
    
    private lazy var importationLabel: UILabel = {
        let tLabel = UILabel()
        tLabel.translatesAutoresizingMaskIntoConstraints = false
        tLabel.text = "IMPORTADO"
        tLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        tLabel.textColor = UIColor(named: "darkGrey")
        tLabel.backgroundColor = UIColor(named: "softYellow")
        tLabel.textAlignment = .center
        return tLabel
    }()

    private lazy var titleLabel: UILabel = {
        let tLabel = UILabel()
        tLabel.translatesAutoresizingMaskIntoConstraints = false
        tLabel.text = "Nombre del\nLibro"
        tLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        tLabel.textColor = UIColor(named: "darkGrey")
        tLabel.numberOfLines = 2
        return tLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(book: BookMapper) {
        titleLabel.text = book.title
        
        let url: URL? = URL(string: book.img)
        bookImageView.kf.setImage(with: url, placeholder: nil, options: [.transition(.fade(0.3))])
        
        if book.imported == true {
            importationLabel.isHidden = false
        } else {
            importationLabel.isHidden = true
        }
    }
}

extension BookCollectionViewCell {
    func setupView() {
        contentView.addSubview(bookImageView)
        bookImageView.addSubview(importationLabel)
        contentView.addSubview(titleLabel)
        
        
        bookImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        bookImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bookImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        bookImageView.heightAnchor.constraint(equalTo: bookImageView.widthAnchor, multiplier: 499/334).isActive = true
        
        importationLabel.leadingAnchor.constraint(equalTo: bookImageView.leadingAnchor).isActive = true
        importationLabel.trailingAnchor.constraint(equalTo: bookImageView.trailingAnchor).isActive = true
        importationLabel.bottomAnchor.constraint(equalTo: bookImageView.bottomAnchor).isActive = true
        importationLabel.heightAnchor.constraint(equalToConstant: 15.0).isActive = true
        
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2.0).isActive = true
        titleLabel.topAnchor.constraint(equalTo: bookImageView.bottomAnchor, constant: 5.0).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -7.0).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    }
}
