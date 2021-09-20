//
//  MainController.swift
//  BookStore
//
//  Created by Edgar Gerardo Flores Lopez on 20/09/21.
//

import Foundation

class MainController {

    private let urlSession: URLSession = {
        let configuration = URLSessionConfiguration.default
        configuration.waitsForConnectivity = false
        let uSession = URLSession(configuration: configuration)
        return uSession
    }()
    
    func getBooks(completion: @escaping (BooksMapper) -> (), fail: @escaping (String) -> () ) {
        let endpoint = "https://raw.githubusercontent.com/ejgteja/files/main/books.json"
        let url = URL(string: endpoint)!

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        urlSession.dataTask(with: request) { data, response, error in

            guard error == nil, let data = data else {
                fail("Error: No se recibió data.")
                return
            }
            
            do {
                let jsonData = try JSONDecoder().decode(BooksMapper.self, from: data)
                completion(jsonData)
            } catch let err {
                fail(err.localizedDescription)
            }
        }.resume()
    }
    
    func getBestSellers(completion: @escaping (BestSellersMapper) -> (), fail: @escaping (String) -> () ) {
        let endpoint = "https://raw.githubusercontent.com/ejgteja/files/main/best_sellers.json"
        let url = URL(string: endpoint)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        urlSession.dataTask(with: request) { data, response, error in

            guard error == nil, let data = data else {
                fail("Error: No se recibió data.")
                return
            }
            
            do {
                let jsonData = try JSONDecoder().decode(BestSellersMapper.self, from: data)
                completion(jsonData)
            } catch let err {
                fail(err.localizedDescription)

            }
        }.resume()
    }
}
