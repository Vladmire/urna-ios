//
//  SmallDetailViewController.swift
//  urna
//
//  Created by imac44 on 20.04.2022.
//

import UIKit

class SmallDetailViewController: UIViewController {

    private var currentPoint: Point!
    
    convenience init(currentPoint: Point) {
        self.init()
        self.currentPoint = currentPoint
    }
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var scheduleLabel: UILabel!
    @IBOutlet var pointRatingStar: [UIImageView]!
    @IBOutlet var closeButton: UIButton!
    @IBAction func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    static func makeSmallDetailPointVC(currentPoint: Point) -> SmallDetailViewController {
        let newViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "smallDetailPoint") as! SmallDetailViewController
        newViewController.currentPoint = currentPoint
        return newViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        closeButton.setTitle("", for: .normal)
        nameLabel.text = currentPoint.name
        addressLabel.text = currentPoint.location
        scheduleLabel.text = currentPoint.schedule
        
        var i = 0
        while i < currentPoint.rating {
            pointRatingStar[i].image = UIImage(named: "filledStarVector")
            i += 1
        }
    }
    
   @IBAction func showdetailPointViewController(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            let detaillVC = DetailPointsViewController.makeDetailPointVC(currentPoint: currentPoint)
            detaillVC.modalPresentationStyle = .custom
            detaillVC.transitioningDelegate = self
            self.present(detaillVC, animated: true, completion: nil)
            
        }
    }
}

extension SmallDetailViewController: UIViewControllerTransitioningDelegate {
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        DetailedPresentationController(presentedViewController: presented, presenting: presenting)
    }
}
