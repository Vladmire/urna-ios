//
//  PlaceMarks.swift
//  urna
//
//  Created by imac44 on 07.04.2022.
//
import Foundation
import MapKit

class MyAnnotation: MKPointAnnotation {
    
//    let identifier: Int
    let point: Point
    
    init(point: Point) {
        self.point = point
        super.init()
    }
    

}
