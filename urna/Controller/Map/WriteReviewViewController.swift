//
//  WriteReviewViewController.swift
//  urna
//
//  Created by imac44 on 19.04.2022.
//

import UIKit

class WriteReviewViewController: UITableViewController, UITextViewDelegate {
    
    var completion: ((Review) -> Void)?
    
    // MARK: - get data for review
    private var currentUser = UserManager.shared.currentUser
    private var currentPoint: Point!
    private let reviewsProvider = ReviewsProvider.shared
    private var rating: Int = 0
    
    
    // MARK: - outlets
    
    @IBOutlet var ratingButtons: [UIButton]!
    @IBOutlet var reviewText: UITextView!
    @IBOutlet var sentButton: UIButton!
    @IBAction func sentButtonTapped() {
        let newReview = Review(userID: currentUser!.userID, image: currentUser?.image ?? "accIcon", name: currentUser?.name ?? "noName", pointID: currentPoint.pointID, rating: rating, text: reviewText.text)
        completion?(newReview)
        dismiss(animated: true)
    }
    @IBAction func ratingButtonTapped(_ sender: UIButton) {
        
        //set up rating
        ratingButtons.forEach {
            $0.setImage(UIImage(named: "starVector"), for: .normal)
            $0.tintColor = UIColor(named: "deleteColor")
        }
        var i = 0
        rating = sender.tag
        while i < sender.tag {
            ratingButtons[i].setImage(UIImage(named: "filledStarVector"), for: .normal)
            i += 1
        }
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sentButton.layer.cornerRadius = 20.0
        tableView.separatorStyle = .none
        reviewText.delegate = self
        sentButton.isEnabled = false
        ratingButtons.forEach { $0.setTitle("", for: .normal) }
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    static func makeWriteReviewViewController(currentPoint: Point) -> WriteReviewViewController {
        let newViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "writeReview") as! WriteReviewViewController
        newViewController.currentPoint = currentPoint
        return newViewController
    }
    
    internal func textViewDidBeginEditing(_ textView: UITextView) {
        reviewText.text = ""
    }
    
    internal func textViewDidEndEditing(_ textView: UITextView) {
        if reviewText.text == "" {
            reviewText.text = "Tell us about your experience about this place? What do you like and what we can improve here?"
        }
    }
    
    internal func textViewDidChange(_ textView: UITextView) {
        sentButton.backgroundColor = UIColor(named: "mainMarine")
        sentButton.tintColor = UIColor.white
        sentButton.isEnabled = true
    }
    // MARK: - Table view data source

}
