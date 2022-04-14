//
//  MapViewController.swift
//  urna
//
//  Created by imac44 on 16.03.2022.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    private let pointsProvider = PointsProvider()
    
    // MARK: - Outlets
    
    @IBOutlet var mapView: MKMapView!
    
    // MARK: - ViewdidLoad method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backButtonTitle = ""
        // TODO: show loading indicator
        pointsProvider.getPoints { [weak self] points, error in
            // TODO: hide loading indicator
            if let err = error {
                //TODO: show error
                print(err)
            } else {
                self?.showDownloadedPoints(points ?? [])
            }
        }
    }
    
    // MARK: - Show points
    
    private func showDownloadedPoints(_ points: [Point]) {
        var annotations: [MyAnnotation] = []
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
                    let annotation = MyAnnotation(point: point)
                    annotation.title = point.name
                    
                    if let location = placemark.location {
                        annotation.coordinate = location.coordinate
                        annotations.append(annotation)
                    }
                }
            })
        }
        group.notify(queue: .main) { [weak self] in
            self?.mapView.showAnnotations(annotations, animated: true)
        }
    }

    // MARK: - Handlers
    
    @IBAction func showFilter(sender: UIButton) {
        performSegue(withIdentifier: "filter", sender: nil)
    }

}

    // MARK: - Placemark delegate

extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
        guard let point = (view.annotation as? MyAnnotation)?.point else {
            return
        }
        let detailVC = DetailPointsViewController.makeDetailPointVC(currentPoint: point)
        detailVC.modalPresentationStyle = .custom
        detailVC.transitioningDelegate = self
        self.present(detailVC, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            self.mapView.deselectAnnotation(view.annotation, animated: true)
        }
    }
}

extension MapViewController: UIViewControllerTransitioningDelegate {
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        DetailedPresentationController(presentedViewController: presented, presenting: presenting)
    }
}
