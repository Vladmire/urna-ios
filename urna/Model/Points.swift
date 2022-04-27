//
//  Points.swift
//  urna
//
//  Created by imac44 on 15.03.2022.
//

import Foundation

struct Point: Hashable {
    
    enum PointType: String {
        case paper = "Paper"
        case plastic = "Plastic"
        case bio = "BIO"
        case batteries = "Batteries"
    }
    
    let pointID: Int
    let name: String
    let type: [PointType]?
    let location: String
    let image: String
    let schedule: String
    let rating: Int
}
