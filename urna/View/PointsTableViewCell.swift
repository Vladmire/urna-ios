//
//  PointsTableViewCell.swift
//  urna
//
//  Created by imac44 on 05.04.2022.
//

import UIKit

class PointsTableViewCell: UITableViewCell {

// MARK: - properties
    
    @IBOutlet var usernameLabel: UILabel!
    
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
    
    @IBOutlet var usernameImage: UIImageView!
    
    
    @IBOutlet var userRatingStar: [UIImageView]!
    
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
