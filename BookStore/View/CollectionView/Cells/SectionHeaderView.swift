//
//  SectionHeaderView.swift
//  BookStore
//
//  Created by Edgar Gerardo Flores Lopez on 20/09/21.
//

import UIKit

class SectionHeaderView: UICollectionReusableView {
    
    static let headerIdentifier = "sectionHeaderView"

    private lazy var titleLabel: UILabel = {
        let tLabel = UILabel()
        tLabel.text = "Nombre de sección"
        tLabel.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        tLabel.textColor = UIColor(named: "darkGrey")
        tLabel.numberOfLines = 2
        return tLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.frame = bounds
    }
    
    func configure(section: Int) {
        switch section {
        case 0:
            titleLabel.text = "Historia"
        case 1:
            titleLabel.text = "Ciencia"
        case 2:
            titleLabel.text = "Negocios"
        case 3:
            titleLabel.text = "Best Seller"
        default:
            return
        }
    }
    
}
