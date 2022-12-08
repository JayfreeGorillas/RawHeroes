
import UIKit

class WeaponCell: UITableViewCell {
    
    @IBOutlet var weaponImage: UIImageView!
    @IBOutlet var weaponName: UILabel!
    var fullSkin = UIImageView()
    
    func setupWeapons(weapon: Weapon) {
        weaponImage.downloaded(from: weapon.displayIcon)
        weaponName.text = weapon.displayName
        fullSkin.downloaded(from: weapon.displayIcon)
    }
}
