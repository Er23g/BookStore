//
//  BestSellersMapper.swift
//  BookStore
//
//  Created by Edgar Gerardo Flores Lopez on 20/09/21.
//

import UIKit

struct BestSellersMapper: Codable {
    let results: BSResultsMapper
}

struct BSResultsMapper: Codable {
    let bestSellers: [String]
    
    private enum CodingKeys: String, CodingKey {
        case bestSellers = "best_sellers"
    }

}
