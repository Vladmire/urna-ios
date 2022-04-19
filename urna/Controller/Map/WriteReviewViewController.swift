//
//  WriteReviewViewController.swift
//  urna
//
//  Created by imac44 on 19.04.2022.
//

import UIKit

class WriteReviewViewController: UITableViewController, UITextViewDelegate {
    
    // MARK: - get data for review
    private var currentUser = UserManager.shared.currentUser
    private var currentPoint: Point!
    private let reviewsProvider = ReviewsProvider()
    private var rating: Int = 0
    
    
    // MARK: - outlets
    
    @IBOutlet var ratingButtons: [UIButton]!
    @IBOutlet var reviewText: UITextView!
    @IBOutlet var sentButton: UIButton!
    @IBAction func sentButtonTapped() {
        let newReview = Review(userID: currentUser.userID, image: currentUser.image, name: currentUser.name, pointID: currentPoint.pointID, rating: rating, text: reviewText.text)
        reviewsProvider.sendReview(newReview: newReview)
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

        tableView.separatorStyle = .none
        reviewText.delegate = self
        sentButton.isEnabled = false
        ratingButtons.forEach { $0.setTitle("", for: .normal) }
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

    

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
