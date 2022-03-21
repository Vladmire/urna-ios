//
//  FilterViewController.swift
//  urna
//
//  Created by imac44 on 21.03.2022.
//

import UIKit

class FilterViewController: UIViewController {
    
    @IBOutlet var filterButton: [UIButton]!
    @IBAction func filterTapped(sender: UIButton) {
        
        switch sender.tag {
        case 1:
            
            sender.backgroundColor = UIColor(named: "filterBgTapped")
            sender.tintColor = UIColor(named: "filterTappedTint")
            
        case 2:
            sender.backgroundColor = UIColor(named: "filterBgTapped")
            sender.tintColor = UIColor(named: "filterTappedTint")
        case 3:
            sender.backgroundColor = UIColor(named: "filterBgTapped")
            sender.tintColor = UIColor(named: "filterTappedTint")
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
