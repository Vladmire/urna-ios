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
    
    private let reviewsProvider = ReviewsProvider()
    private var currentReviews: [Review] = []
    private var currentPoint: Point!

    private let filter: [Filter] = [Filter(title: "Plastic", image: "bottle", type: .plastic),
                            Filter(title: "BIO", image: "apple", type: .bio),
                            Filter(title: "Paper", image: "document", type: .paper)]
    
    convenience init(currentPoint: Point) {
        self.init()
        self.currentPoint = currentPoint
        
    }
    
    // MARK: - Outlets
    @IBOutlet var headerView: UITableViewHeaderFooterView!
    @IBOutlet var nameLabel: UILabel! {
        didSet {
            nameLabel.text = currentPoint.name
        }
    }
    
    @IBOutlet var addressLabel: UILabel!
    
    @IBOutlet var scheduleLabel: UILabel!
    
    @IBOutlet var filterButtons: [UIButton]! {
        didSet {
            filterButtons[0].setTitle(filter[0].title, for: .normal)
            filterButtons[0].setImage(UIImage(named: filter[0].image), for: .normal)
            
            filterButtons[1].setTitle(filter[1].title, for: .normal)
            filterButtons[1].setImage(UIImage(named: filter[1].image), for: .normal)
            
            filterButtons[2].setTitle(filter[2].title, for: .normal)
            filterButtons[2].setImage(UIImage(named: filter[2].image), for: .normal)
        }
    }
    
    @IBOutlet var pointRatingStar: [UIImageView]! {
        didSet {
            var i = 1
            while i < currentPoint.rating {
                pointRatingStar[i].image = UIImage(named: "filledStarVector")
                i += 1
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return headerView
    }
    
    // MARK: - configure table data

    lazy var dataSource = configureDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        reviewsProvider.getReviews { [weak self] reviews, error in
            // TODO: hide loading indicator
            if let err = error {
                //TODO: show error
                print(err)
            } else {
                self?.currentReviews = reviews ?? []
            }
        }
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.dataSource = dataSource
        tableView.separatorStyle = .none
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Review>()
        snapshot.appendSections([.all])
        snapshot.appendItems(currentReviews, toSection: .all)
        
        dataSource.apply(snapshot, animatingDifferences: false)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    func configureDataSource() -> UITableViewDiffableDataSource<Section, String> {
        
        let cellIdentifier = "reviewcell"
        
        let dataSource = UITableViewDiffableDataSource<Section, String>(
            tableView: tableView,
            cellProvider: {  tableView, indexPath, currentUser.name in
                let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! PointsTableViewCell
                
                cell.nameLabel.text = restaurantName
                cell.locationLabel.text = self.restaurantLocations[indexPath.row]
                cell.typeLabel.text = self.restaurantTypes[indexPath.row]
                cell.thumbnailImageView.image = UIImage(named: self.restaurantImages[indexPath.row])
                
                // Solution to exercise #2
                cell.favoriteImageView.isHidden = self.restaurantIsFavorites[indexPath.row] ? false : true
                
                return cell
            }
        )
        
        return dataSource
    }

}
