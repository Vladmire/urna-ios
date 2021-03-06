//
//  FilterViewController.swift
//  urna
//
//  Created by imac44 on 21.03.2022.
//

import UIKit

class FilterViewController: UIViewController {
    
    private var butTapped = Array(repeating: false, count: 4)
    
    // MARK: - Outlets
    
    @IBOutlet var filterButton: [UIButton]!
    @IBOutlet var applyButton: UIButton!
    
    @IBAction func filterTapped(sender: UIButton) {
        switch sender.tag {
        case 1:
            if butTapped[0] {
                butTapped[0] = false
                sender.backgroundColor = UIColor(named: "filterBg")
                sender.tintColor = UIColor.systemGray
            } else {
                butTapped[0] = true
                sender.backgroundColor = UIColor(named: "filterBgTapped")
                sender.tintColor = UIColor(named: "filterTappedTint")
            }
        case 2:
            if butTapped[1] {
                butTapped[1] = false
                sender.backgroundColor = UIColor(named: "filterBg")
                sender.tintColor = UIColor.systemGray
            } else {
                butTapped[1] = true
                sender.backgroundColor = UIColor(named: "filterBgTapped")
                sender.tintColor = UIColor(named: "filterTappedTint")
            }
        case 3:
            if butTapped[2] {
                butTapped[2] = false
                sender.backgroundColor = UIColor(named: "filterBg")
                sender.tintColor = UIColor.systemGray
            } else {
                butTapped[2] = true
                sender.backgroundColor = UIColor(named: "filterBgTapped")
                sender.tintColor = UIColor(named: "filterTappedTint")
            }
        case 4:
            if butTapped[3] {
                butTapped[3] = false
                sender.backgroundColor = UIColor(named: "filterBg")
                sender.tintColor = UIColor.systemGray
            } else {
                butTapped[3] = true
                sender.backgroundColor = UIColor(named: "filterBgTapped")
                sender.tintColor = UIColor(named: "filterTappedTint")
            }
        default: break
        }
    }

    
    @IBAction private func applyButtonTapped() {
            dismiss(animated: true)
            completion?(butTapped)
    }
    
    var completion: (([Bool]) -> Void)?
    
    private func changeFilterStatus(butTapped: [Bool]) {
        var i = 0
        for butTap in butTapped {
            if butTap {
                filterButton[i].backgroundColor = UIColor(named: "filterBgTapped")
                filterButton[i].tintColor = UIColor(named: "filterTappedTint")
            }
            i += 1
        }
    }
    
    static func makeFilterVC(currentFilter: [Bool], completion: @escaping ([Bool]) -> Void) -> FilterViewController {
        let newViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "filterViewController") as! FilterViewController
        newViewController.butTapped = currentFilter
        newViewController.completion = completion
        return newViewController
    }
    // MARK: - ViewdidLoad method
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for filterButton in filterButton {
            filterButton.layer.cornerRadius = 10
        }
        applyButton.layer.cornerRadius = 20
    }
    
    override func viewDidAppear(_ animated: Bool) {
        changeFilterStatus(butTapped: butTapped)
    }
}
