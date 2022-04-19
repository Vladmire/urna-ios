//
//  ChangeFinishedViewController.swift
//  urna
//
//  Created by imac44 on 19.04.2022.
//

import UIKit

class ChangeFinishedViewController: UIViewController {

    // MARK: - Outlets
    
    @IBAction func greatButtonPressed() {
        let storyboard = UIStoryboard(name: "Auth", bundle: nil)
        let navBarController = storyboard.instantiateInitialViewController()!
        view.window?.windowScene?.windows.first?.rootViewController = navBarController
//
//        let detailVC = DetailPointsViewController.makeDetailPointVC(currentPoint: point)
//        detailVC.modalPresentationStyle = .custom
//        detailVC.transitioningDelegate = self
//        self.present(detailVC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
