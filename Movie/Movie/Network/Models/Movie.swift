//
//  Movie.swift
//  Movie
//
//  Created by Burak Nurçiçek on 14.09.2022.
//

import Foundation

struct Movie: Decodable {
    let imageUrl: String?
    let title: String?
    let genre: String?
    let id: Int?
}
