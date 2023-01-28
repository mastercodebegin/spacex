//
//  LaunchCell.swift
//  SpaceX
//
//  Created by Nitin Soni on 27/01/23.
//

import UIKit

class LaunchCell: UITableViewCell {
    
    @IBOutlet var launchImage : UIImageView!
    @IBOutlet var launchMission : UILabel!
    @IBOutlet var launchDateTime : UILabel!
    @IBOutlet var launchRocket : UILabel!
    @IBOutlet var launchDays : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
