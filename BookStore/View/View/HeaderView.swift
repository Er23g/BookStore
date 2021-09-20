//
//  HeaderView.swift
//  BookStore
//
//  Created by Edgar Gerardo Flores Lopez on 20/09/21.
//

import UIKit

class HeaderView: UIView {
    
    private lazy var contentView: UIView = {
        let cView = UIView()
        cView.translatesAutoresizingMaskIntoConstraints = false
        cView.backgroundColor = UIColor.clear
        return cView
    }()
    
    private lazy var circleView: UIView = {
        let cView = UIView()
        cView.translatesAutoresizingMaskIntoConstraints = false
        cView.backgroundColor = UIColor(named: "darkGrey")
        cView.layer.cornerRadius = 40
        cView.clipsToBounds = true
        return cView
    }()
    
    private lazy var headerImageView: UIImageView = {
        let hiView = UIImageView()
        hiView.translatesAutoresizingMaskIntoConstraints = false
        hiView.image = UIImage(named: "logo")
        hiView.contentMode = .scaleAspectFill
        
        return hiView
    }()
    
    private lazy var titleLabel: UILabel = {
        let tLabel = UILabel()
        tLabel.translatesAutoresizingMaskIntoConstraints = false
        tLabel.text = "Bienvenidos a\nBookStore"
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
    
}

extension HeaderView {
    func setupView() {
        addSubview(contentView)
        contentView.addSubview(circleView)
        circleView.addSubview(headerImageView)
        contentView.addSubview(titleLabel)
        
        contentView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        circleView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                            constant: 15).isActive = true
        circleView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        circleView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        circleView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        circleView.heightAnchor.constraint(equalTo: circleView.widthAnchor).isActive = true
        
        headerImageView.centerXAnchor.constraint(equalTo: circleView.centerXAnchor).isActive = true
        headerImageView.centerYAnchor.constraint(equalTo: circleView.centerYAnchor).isActive = true
        headerImageView.widthAnchor.constraint(equalTo: circleView.widthAnchor, multiplier: 0.55).isActive = true
        headerImageView.heightAnchor.constraint(equalTo: headerImageView.widthAnchor).isActive = true
        
        titleLabel.leadingAnchor.constraint(equalTo: circleView.trailingAnchor, constant: 30).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: circleView.centerYAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40).isActive = true
    }
}
