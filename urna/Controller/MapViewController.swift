//
//  MapViewController.swift
//  urna
//
//  Created by imac44 on 16.03.2022.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet var mapView: MKMapView!
    
    var points: [Point] = [Point(name: "campus A", type: "learning campus", location: "Chekhov Street, 22 Taganrog Rostov Oblast Russia 347922", image: "campusA"),
                           Point(name: "campus B", type: "learning campus", location: "Chekhov Street, 24 Taganrog Rostov Oblast Russia 347922", image: "campusB"),
                           Point(name: "campus V", type: "learning campus", location: "Petrovskaya Street, 81 Taganrog Rostov Oblast Russia 347900", image: "campusV"),
                           Point(name: "Campus G", type: "learning campus", location: "Engelsa Street, 1 Taganrog, Rostov Oblast Russia 347922", image: "campusG"),
                           Point(name: "campus D", type: "learning campus", location: "Nekrasovskiy Lane, 44 Taganrog, Rostov Oblast Russia 347928", image: "campusD"),
                           Point(name: "campus I", type: "learning campus", location: "Chekhov Street, 2 Taganrog Rostov Oblast Russia 347922", image: "campusI")]
    





    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let placeMarks
        var annotations: [MKPointAnnotation] = []
        let group = DispatchGroup()
        
        for point in points {
            group.enter()
            let geoCoder = CLGeocoder()
            geoCoder.geocodeAddressString(point.location, completionHandler: {placemarks, error in
                defer {
                    group.leave()
                }
                if let error = error {
                    print("Error geocoding", error)
                    return
                }
            
                if let placemark = placemarks?.first {
                            
                    let annotation = MKPointAnnotation()
                    annotation.title = point.name
                    annotation.subtitle = point.type
                            
                    if let location = placemark.location {
                        annotation.coordinate = location.coordinate
                        annotations.append(annotation)
                    }
                }
            })
        }
        group.notify(queue: .main) {
            self.mapView.showAnnotations(annotations, animated: true)
            self.mapView.selectAnnotation(annotations[0], animated: true)
        }
        
    }

}

