//
//  Points.swift
//  urna
//
//  Created by imac44 on 15.03.2022.
//

import Foundation

struct Point {
    
    enum PointType: String {
        case paper
        case plastic
        case bio
        case none
    }
    
    var name: String = ""
    var type: PointType = .none
    var location: String = ""
    var image: String = ""
}
