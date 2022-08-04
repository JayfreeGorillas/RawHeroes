//
//  WeaponCell.swift
//  RawHeroes
//
//  Created by Josfry Barillas on 8/3/22.
//

import UIKit

class WeaponCell: UITableViewCell {

    @IBOutlet var weaponImage: UIImageView!
    
    @IBOutlet var weaponName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
