//
//  PointsTableViewCell.swift
//  urna
//
//  Created by imac44 on 05.04.2022.
//

import UIKit

class PointsTableViewCell: UITableViewCell {

// MARK: - properties
    
    @IBOutlet var usernameLabel: UILabel! {
        didSet {
            usernameLabel.text = user.name
        }
    }
    
    @IBOutlet var dateLabel: UILabel! {
        didSet {
            dateLabel.text = "5.04.2022"
        }
    }
    
    @IBOutlet var reviewtextLabel: UILabel! {
        didSet {
            reviewtextLabel.text = "Lorem ipsum aaaaaaaa aaaadds ferffgefrd fefefvfr dferfdwr rfwsdfre fergfwrf"
        }
    }
    
    @IBOutlet var usernameImage: UIImageView! {
        didSet {
            usernameImage.image = UIImage(named: user.image)
        }
    }
    
    @IBOutlet var userRatingStar: [UIImageView]! {
        didSet {
            var i = 0
            while i < point.rating {
                userRatingStar[i].image = UIImage(named: "filledStarVector")
                i += 1
            }
        }
        
    }
    
// MARK: - methods

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
