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
    
    let reviews = [Review(userID: 1, pointID: 1, rating: 3, text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore                        magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in                               reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt                 mollit anim id est laborum"),
                   Review(userID: 1, pointID: 2, rating: 4, text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"),
                   Review(userID: 1, pointID: 3, rating: 5, text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in        reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia   deserunt mollit anim id est laborum"),
                   Review(userID: 1, pointID: 4, rating: 3, text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"),
                   Review(userID: 1, pointID: 5, rating: 4, text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in        reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia   deserunt mollit anim id est laborum"),
                   Review(userID: 2, pointID: 6, rating: 5, text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"),
                   Review(userID: 1, pointID: 1, rating: 3, text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in        reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia   deserunt mollit anim id est laborum"),
                   Review(userID: 2, pointID: 2, rating: 4, text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum")]
    
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
    
    // MARK: - init a viewcontroller in stryboard
    
    static func makeDetailPointVC(currentPoint: Point) -> DetailPointsViewController {
        let newViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detailPoint") as! DetailPointsViewController
        newViewController.currentPoint = currentPoint
        return newViewController
    }
    
    // MARK: - configure table data
    
    lazy var dataSource = configureDataSource()
    private var updateFrame = true
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        guard updateFrame else { return }
        updateFrame = false
        tableView.updateHeaderFrame()
    }
    
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
            print(reviewAuthors)
        }
        
        //set value for elements
        
        filterButtons1.setTitle(filter[0].title, for: .normal)
        filterButtons1.setImage(UIImage(named: filter[0].image), for: .normal)

        filterButtons2.setTitle(filter[1].title, for: .normal)
        filterButtons2.setImage(UIImage(named: filter[1].image), for: .normal)

        filterButtons3.setTitle(filter[2].title, for: .normal)
        filterButtons3.setImage(UIImage(named: filter[2].image), for: .normal)
        
        nameLabel.text = currentPoint.name
        addressLabel.text = currentPoint.location
        scheduleLabel.text = currentPoint.schedule
        
        var i = 0
        while i < currentPoint.rating {
            pointRatingStar[i].image = UIImage(named: "filledStarVector")
            i += 1
        }
        
        tableView.dataSource = dataSource
        tableView.separatorStyle = .none
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Review>()
        snapshot.appendSections([.all])
        snapshot.appendItems(reviews, toSection: .all)
        
        dataSource.apply(snapshot, animatingDifferences: false)
        
        tableView.cellLayoutMarginsFollowReadableWidth = true
    }

    // MARK: - Table view data source
    
    func configureDataSource() -> UITableViewDiffableDataSource<Section, Review> {
        let cellIdentifier = "reviewcell"
        
        let dataSource = UITableViewDiffableDataSource<Section, Review>(
            tableView: tableView,
            cellProvider: { tableView, indexPath, review in
                let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! PointsTableViewCell
                
                cell.reviewtextLabel.text = review.text
                //cell.usernameLabel.text = review.
                //print(currentReviews)

                var i = 0
                while i < review.rating {
                    cell.userRatingStar[i].image = UIImage(named: "filledStarVector")
                    i += 1
                }
                
                return cell
            })
        
        return dataSource
    }
}
