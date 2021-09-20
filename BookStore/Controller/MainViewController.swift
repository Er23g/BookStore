//
//  MainViewController.swift
//  BookStore
//
//  Created by Edgar Gerardo Flores Lopez on 19/09/21.
//

import UIKit

class MainViewController: UIViewController {
    
    private let contentView = UIView(frame: .zero)
    
    var books = [BookMapper](){
        didSet{
            hsBooks = books.filter { $0.genre == "History"}
            scBooks = books.filter { $0.genre == "Science"}
            buBooks = books.filter { $0.genre == "Business"}

            booksColleciontView.reloadData()
        }
    }
    var bestSellers: BSResultsMapper! {
        didSet{
            var filteredBooks = [BookMapper]()
            
            for book in bestSellers.bestSellers {
                filteredBooks += books.filter { $0.isbn == book}
                
            }
            
            bsBooks = filteredBooks
            booksColleciontView.reloadData()

        }
    }
    
    var bsBooks = [BookMapper]() {
        didSet {
            print(bsBooks)
        }
    }
    var hsBooks = [BookMapper]()
    var scBooks = [BookMapper]()
    var buBooks = [BookMapper]()
    
    private let nextCollectionCellWidth = UIScreen.main.bounds.width*(176/414)
    private let nextCollectionCellHeight = UIScreen.main.bounds.width*(176/414)*(269/176)
    lazy var mainController = MainController()

    private lazy var headerView: HeaderView = {
        let hView  = HeaderView()
        hView.translatesAutoresizingMaskIntoConstraints = false
        return hView
    }()
    
    private lazy var booksColleciontView: UICollectionView = {
        let bCollectionViewFlowLayout = UICollectionViewFlowLayout()
        bCollectionViewFlowLayout.scrollDirection = .vertical
        bCollectionViewFlowLayout.itemSize = CGSize(width: nextCollectionCellWidth - 2.5,
                                                    height: nextCollectionCellHeight - 10.0)
        bCollectionViewFlowLayout.minimumInteritemSpacing = 0.0
        bCollectionViewFlowLayout.minimumLineSpacing = 10.0
        let bColleciontView = UICollectionView(frame: .zero,
                                                           collectionViewLayout: bCollectionViewFlowLayout)
        bColleciontView.translatesAutoresizingMaskIntoConstraints = false
        bColleciontView.delegate = self
        bColleciontView.dataSource = self
        bColleciontView.backgroundColor = .clear
        bColleciontView.register(BookCollectionViewCell.self,
                                 forCellWithReuseIdentifier: BookCollectionViewCell.cellName)
        bColleciontView.register(SectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeaderView.headerIdentifier)
        bColleciontView.showsVerticalScrollIndicator = false
        bColleciontView.showsHorizontalScrollIndicator = false
        bColleciontView.keyboardDismissMode = .onDrag
        bColleciontView.bounces = true
        bColleciontView.tag = 1
        return bColleciontView
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        getBooks()
        setupViewController()
        


        
        
 
    }
    
    private func getBooks() {
        mainController.getBooks(completion: { jsonData in
            DispatchQueue.main.sync {
                self.books = jsonData.results.books
                self.getBestSellers()
            }
        }, fail: { err in
            print(err)
        })
    }
    
    private func getBestSellers() {
        
        mainController.getBestSellers(completion: { jsonData in
            DispatchQueue.main.sync {
                self.bestSellers = jsonData.results
            }
        }, fail: { err in
            print(err)
        })
        
    }
    
    func setupViewController() {
        view.backgroundColor = UIColor.white
        view.addSubview(headerView)
        view.addSubview(booksColleciontView)
        
        headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        booksColleciontView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.0).isActive = true
        booksColleciontView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 10.0).isActive = true
        booksColleciontView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        booksColleciontView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeaderView.headerIdentifier, for: indexPath) as? SectionHeaderView
            header!.configure(section: indexPath.section)
        return header!
    }
    
    @objc func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 35.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return hsBooks.count
        case 1:
            return scBooks.count
        case 2:
            return buBooks.count
        case 3:
            return bsBooks.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookCollectionViewCell.cellName, for: indexPath)
        return cell

    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let cell = cell as? BookCollectionViewCell {
            switch indexPath.section {
            case 0:
                return cell.configure(book: hsBooks[indexPath.row])
            case 1:
                return cell.configure(book: scBooks[indexPath.row])
            case 2:
                return cell.configure(book: buBooks[indexPath.row])
            case 3:
                return cell.configure(book: bsBooks[indexPath.row])
            default:
                return
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let toPresentController: UIViewController
        let bookDetailViewController = BookDetailViewController()

        switch indexPath.section {
        case 0:
            bookDetailViewController.configure(book: hsBooks[indexPath.row])
        case 1:
            bookDetailViewController.configure(book: scBooks[indexPath.row])
        case 2:
            bookDetailViewController.configure(book: buBooks[indexPath.row])
        case 3:
            bookDetailViewController.configure(book: bsBooks[indexPath.row])
        default:
            return
        }

        
        
        if #available(iOS 13.0, *) {
           toPresentController = bookDetailViewController
        } else {
           let bookDetailNavigation = UINavigationController(rootViewController: bookDetailViewController)
           toPresentController = bookDetailNavigation
           toPresentController.modalTransitionStyle = .crossDissolve
        }
        
        present(toPresentController, animated: true)
    }

}
