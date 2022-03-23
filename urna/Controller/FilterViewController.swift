//
//  FilterViewController.swift
//  urna
//
//  Created by imac44 on 21.03.2022.
//

import UIKit

class FilterViewController: UIViewController {
    var butTapped = Array(repeating: true, count: 3)
    @IBOutlet var filterButton: [UIButton]!
    @IBAction func filterTapped(sender: UIButton) {
        
        switch sender.tag {
        case 1:
            if butTapped[0] {
                butTapped[0] = false
                sender.backgroundColor = UIColor(named: "filterBgTapped")
                sender.tintColor = UIColor(named: "filterTappedTint")
                
            } else {
                butTapped[0] = true
                sender.backgroundColor = UIColor(named: "filterBg")
                sender.tintColor = UIColor.systemGray
                
            }
        case 2:
            if butTapped[1] {
                butTapped[1] = false
                sender.backgroundColor = UIColor(named: "filterBgTapped")
                sender.tintColor = UIColor(named: "filterTappedTint")
                
            } else {
                butTapped[1] = true
                sender.backgroundColor = UIColor(named: "filterBg")
                sender.tintColor = UIColor.systemGray
                
            }
        case 3:
            if butTapped[2] {
                butTapped[2] = false
                sender.backgroundColor = UIColor(named: "filterBgTapped")
                sender.tintColor = UIColor(named: "filterTappedTint")
                
            } else {
                butTapped[2] = true
                sender.backgroundColor = UIColor(named: "filterBg")
                sender.tintColor = UIColor.systemGray
                
            }
        default: break
        }
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
