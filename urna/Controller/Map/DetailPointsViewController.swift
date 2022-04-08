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
    
    // MARK: - get data
    
    private let reviewsProvider = ReviewsProvider()
    private var currentReviews: [Review] = []
    private var currentPoint: Point!
    private var userReviews: User!

    private let filter: [Filter] = [Filter(title: "Plastic", image: "bottle", type: .plastic),
                            Filter(title: "BIO", image: "apple", type: .bio),
                            Filter(title: "Paper", image: "document", type: .paper)]
    
    convenience init(currentPoint: Point) {
        self.init()
        self.currentPoint = currentPoint
    }
    
    // MARK: - Outlets
    
    @IBOutlet var headerView: UITableViewHeaderFooterView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var scheduleLabel: UILabel!
    
    @IBOutlet var filterButtons1: UIButton!
    @IBOutlet var filterButtons2: UIButton!
    @IBOutlet var filterButtons3: UIButton!
    
    @IBOutlet var pointRatingStar: [UIImageView]!
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "sectionHeader")
        return view
    }
    
    // MARK: - configure table data
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //get reviews for current point
        reviewsProvider.getReviews(currentPoint: currentPoint.pointID) { [weak self] reviews, error in
            // TODO: hide loading indicator
            if let err = error {
                //TODO: show error
                print(err)
            } else {
                self?.currentReviews = reviews ?? []
            }
        }
        //get users who write the reviews
        for review in currentReviews {
            var reviewAuthors: [User] = []
            reviewAuthors.append(UserManager.shared.getReviewAuthor(userID: review.userID))
        }
        
        
        //set value for elements
        
        filterButtons1.setTitle(filter[0].title, for: .normal)
        filterButtons1.setImage(UIImage(named: filter[0].image), for: .normal)
        
        filterButtons2.setTitle(filter[1].title, for: .normal)
        filterButtons2.setImage(UIImage(named: filter[1].image), for: .normal)
        
        filterButtons3.setTitle(filter[2].title, for: .normal)
        filterButtons3.setImage(UIImage(named: filter[2].image), for: .normal)
        
        //self.tableView.delegate = self
        //self.tableView.dataSource = self
        //tableView.dataSource = dataSource
        tableView.separatorStyle = .none
        //tableView.register(headerView.self, forHeaderFooterViewReuseIdentifier: "sectionHeader")
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
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reviewcell", for: indexPath) as! PointsTableViewCell
        
//        cell.usernameLabel?.text =
//        cell.
        
        return cell
    }
}
