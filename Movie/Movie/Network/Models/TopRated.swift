//
//  TopRated.swift
//  Movie
//
//  Created by Burak Nurçiçek on 15.09.2022.
//

import Foundation

struct TopRated: Decodable {
    let page: Int
    let totalPages: Int
    let totalResults: Int
    let results: [Movie]

    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
