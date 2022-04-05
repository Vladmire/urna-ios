//
//  DetailPointsViewController.swift
//  urna
//
//  Created by imac44 on 05.04.2022.
//

import UIKit

class DetailPointsViewController: UITableViewController {
    
    var point: Point = Point(name: "campus A", type: .none, location: "Chekhov Street, 22 Taganrog Rostov Oblast Russia 347922", image: "campusA")
    var user: User = User(login: "admin", password: "admin", email: "dubo@sfedu.ru", image: "user photo", name: "Gosha", gender: .male)
    var pointFilter = ["Plastic", "BIO", "Paper"]
    var pointReviews = [""]
    var pointRating = 4
    var pointFilterImage = ["bottle", "apple", "document"]
    
    @IBOutlet var nameLabel: UILabel! {
        didSet {
            nameLabel.text = point.name
        }
    }
    
    @IBOutlet var addressLabel: UILabel! {
        didSet {
            addressLabel.text = point.location
        }
    }
    
    @IBOutlet var scheduleLabel: UILabel! {
        didSet {
            scheduleLabel.text = "пн. - пт. 9:30 - 17:00"
        }
    }
    
    @IBOutlet var filterButton: [UIButton]! {
        didSet {
            filterButton[0].setTitle(pointFilter[0], for: .normal)
            filterButton[0].setImage(UIImage(named: pointFilterImage[0]), for: .normal)
            
            filterButton[1].setTitle(pointFilter[1], for: .normal)
            filterButton[1].setImage(UIImage(named: pointFilterImage[1]), for: .normal)
            
            filterButton[2].setTitle(pointFilter[2], for: .normal)
            filterButton[2].setImage(UIImage(named: pointFilterImage[2]), for: .normal)
        }
        
    }
    
    @IBOutlet var pointRatingStar: [UIImageView]! {
        didSet {
            var i = 0
            while i < pointRating {
                userRatingStar[i].image = UIImage(named: "filledStarVector")
                i += 1
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pointReviews.count
    }
    

    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "reviewcell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        return cell
    }

}
