//
//  BooksMapper.swift
//  BookStore
//
//  Created by Edgar Gerardo Flores Lopez on 20/09/21.
//

import UIKit

struct BooksMapper: Codable {
    let results: ResultsMapper
}

struct ResultsMapper: Codable {
    let books: [BookMapper]
}

struct BookMapper: Codable {
    let isbn: String
    let title: String
    let author: String
    let description: String
    let genre: String
    let img: String
    let imported: Bool
}
