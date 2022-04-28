//
//  MapViewController.swift
//  urna
//
//  Created by imac44 on 16.03.2022.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    private var currentAnnotations: [MyAnnotation] = []
    private let pointsProvider = PointsProvider()
    private var isFilterButtonTapped = Array(repeating: true, count: 4)
    
    // MARK: - Outlets
    
    @IBOutlet private var mapView: MKMapView!
    @IBOutlet private var filterButton: UIButton!
    @IBAction private func filterButtonTapped() {
        let controller = FilterViewController.makeFilterVC(currentFilter: isFilterButtonTapped) { [weak self] filterTapped in
            guard let welf = self else { return }
            self?.isFilterButtonTapped = filterTapped
            welf.hideAnnotations(self!.currentAnnotations)
            if filterTapped.elementsEqual([true, true, true, true]) {
                welf.showDownloadedPoints(welf.currentAnnotations)
            }
        
            var filteredAnnotations: [MyAnnotation] = []
            if !welf.isFilterButtonTapped[0] {
                for annotation in welf.currentAnnotations {
                    if annotation.point.type!.contains(.plastic) {
                        filteredAnnotations.append(annotation)
                    }
                }
            }
            if !welf.isFilterButtonTapped[1] {
                for annotation in welf.currentAnnotations {
                    if annotation.point.type!.contains(.bio) {
                        filteredAnnotations.append(annotation)
                    }
                }
            }
            if !welf.isFilterButtonTapped[2] {
                for annotation in welf.currentAnnotations {
                    if annotation.point.type!.contains(.paper) {
                        filteredAnnotations.append(annotation)
                    }
                }
            }
            if !welf.isFilterButtonTapped[3] {
                for annotation in welf.currentAnnotations {
                    if annotation.point.type!.contains(.batteries) {
                        filteredAnnotations.append(annotation)
                    }
                }
            }
            welf.showDownloadedPoints(filteredAnnotations)
        }
        controller.modalPresentationStyle = .overFullScreen
        self.present(controller, animated: false, completion: nil)
        
       
    }
    
    // MARK: - ViewdidLoad method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filterButton.layer.cornerRadius = filterButton.frame.height / 5
        
        navigationItem.backButtonTitle = ""
        // TODO: show loading indicator
        pointsProvider.getPoints { [weak self] points, error in
            // TODO: hide loading indicator
            if let err = error {
                //TODO: show error
                print(err)
            } else {
                self?.decodePointLocation(points: points ?? [])
            }
        }
    }
    
    // MARK: - decode point location
    
    private func decodePointLocation(points: [Point]) {
        
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
            self!.currentAnnotations = annotations
            self?.showDownloadedPoints(annotations)
            
        }
    }
    
    // MARK: - Show points
    
    private func showDownloadedPoints(_ annotations: [MyAnnotation]) {
        mapView.showAnnotations(annotations, animated: true)
        
    }
    
    private func hideAnnotations(_ annotations: [MyAnnotation]) {
        mapView.removeAnnotations(annotations)
    }

    // MARK: - Handlers

}

    // MARK: - Placemark delegate

extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
        guard let point = (view.annotation as? MyAnnotation)?.point else {
            return
        }
        let smallDetaillVC = SmallDetailViewController.makeSmallDetailPointVC(currentPoint: point)
        smallDetaillVC.modalPresentationStyle = .custom
        smallDetaillVC.transitioningDelegate = self
        self.present(smallDetaillVC, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            self.mapView.deselectAnnotation(view.annotation, animated: true)
        }
    }
}

extension MapViewController: UIViewControllerTransitioningDelegate {
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        SmallDetailedPresentationController(presentedViewController: presented, presenting: presenting)
    }
}
