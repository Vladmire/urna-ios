//
//  DetailPointsViewController.swift
//  urna
//
//  Created by imac44 on 05.04.2022.
//

import UIKit

class DetailPointsViewController: UITableViewController {
    
    enum Section {
        case all
    }
    let mapVC = MapViewController()
    
    
    var user: User = User(login: "admin", password: "admin", email: "dubo@sfedu.ru", image: "user photo", name: "Gosha", gender: .male)
    var filter: [Filter] = [Filter(title: "Plastic", image: "bottle", type: .plastic),
                            Filter(title: "BIO", image: "apple", type: .bio),
                            Filter(title: "Paper", image: "document", type: .paper)]
    
    
    // MARK: - Outlets
    
    @IBOutlet var nameLabel: UILabel! {
        didSet {
            nameLabel.text = mapVC.points[0].name
        }
    }
    
    @IBOutlet var addressLabel: UILabel! {
        didSet {
            addressLabel.text = mapVC.points[0].location
        }
    }
    
    @IBOutlet var scheduleLabel: UILabel! {
        didSet {
            scheduleLabel.text = mapVC.points[0].schedule
        }
    }
    
    @IBOutlet var filterButton: [UIButton]! {
        didSet {
            filterButton[0].setTitle(filter[0].title, for: .normal)
            filterButton[0].setImage(UIImage(named: filter[0].image), for: .normal)
            
            filterButton[1].setTitle(filter[1].title, for: .normal)
            filterButton[1].setImage(UIImage(named: filter[1].image), for: .normal)
            
            filterButton[2].setTitle(filter[2].title, for: .normal)
            filterButton[2].setImage(UIImage(named: filter[2].image), for: .normal)
        }
        
    }
    
    @IBOutlet var pointRatingStar: [UIImageView]! {
        didSet {
            var i = 0
            while i < mapVC.points[0].rating {
                pointRatingStar[i].image = UIImage(named: "filledStarVector")
                i += 1
            }
        }
    }
    
    // MARK: - configure table data

    lazy var dataSource = configureDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = dataSource
        tableView.separatorStyle = .none
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, String>()
        snapshot.appendSections([.all])
        snapshot.appendItems(point.name, toSection: .all)
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
