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
    
    // MARK: - Reviews collection
    
    
    // MARK: - Get data
    
    private let reviewsProvider = ReviewsProvider.shared
    private var currentReviews: [Review] = []
    private var currentPoint: Point!
    private var userReviews: User!

    private let filter: [Filter] = [Filter(title: "Plastic", image: "bottle", type: .plastic),
                            Filter(title: "BIO", image: "apple", type: .bio),
                            Filter(title: "Paper", image: "document", type: .paper)]
    
    //get selected point from MapVC
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
    @IBOutlet var writeReviewButton: UIButton!
    @IBOutlet var closeButton: UIButton!
    @IBAction func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func writeReviewTapped() {
        let writeReviewlVC = WriteReviewViewController.makeWriteReviewViewController(currentPoint: currentPoint)
        writeReviewlVC.completion = { [weak self] newReview in
            self?.reviewsProvider.sendReview(newReview: newReview)
            self?.receivedNewReview(newReview)
        }
        writeReviewlVC.modalPresentationStyle = .custom
        writeReviewlVC.transitioningDelegate = self
        self.present(writeReviewlVC, animated: true, completion: nil)
        
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
    
    // MARK: - ViewDidLoad method
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //get reviews for current point
        reloadReviews()
        //set value for elements
        
        filterButtons1.setTitle(filter[0].title, for: .normal)
        filterButtons1.setImage(UIImage(named: filter[0].image), for: .normal)

        filterButtons2.setTitle(filter[1].title, for: .normal)
        filterButtons2.setImage(UIImage(named: filter[1].image), for: .normal)

        filterButtons3.setTitle(filter[2].title, for: .normal)
        filterButtons3.setImage(UIImage(named: filter[2].image), for: .normal)
        
        writeReviewButton.layer.cornerRadius = 20.0
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
    
    private func reloadReviews() {
        reviewsProvider.getReviews(currentPoint: currentPoint.pointID) { [weak self] reviews, error in
            // TODO: hide loading indicator
            if let err = error {
                //TODO: show error
                print(err)
            } else {
                self?.currentReviews = reviews ?? []
            }
        }
        tableView.dataSource = dataSource
        tableView.separatorStyle = .none
        var snapshot = NSDiffableDataSourceSnapshot<Section, Review>()
        snapshot.appendSections([.all])
        snapshot.appendItems(currentReviews, toSection: .all)
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
                cell.usernameLabel.text = review.name
                cell.usernameImage.image = UIImage(named: review.image)
                
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
                
                cell.dateLabel.text = dateFormatter.string(from: review.date)
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

extension DetailPointsViewController: UIViewControllerTransitioningDelegate {
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        DetailedPresentationController(presentedViewController: presented, presenting: presenting)
    }
}


extension DetailPointsViewController: ReviewsProviderDelegate {
    
    func receivedNewReview(_ review: Review) {
        reloadReviews()
        tableView.reloadData()
    }

}
