//
//  Reviews.swift
//  urna
//
//  Created by imac44 on 06.04.2022.
//

import Foundation


struct Review: Hashable {
    let userID: Int
    let image: String
    let name: String
    let pointID: Int
    let rating: Int
    let text: String
    let date = Date()
}
