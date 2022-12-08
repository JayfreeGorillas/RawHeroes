import UIKit

class WeaponDetailVC: UIViewController {
    
    @IBOutlet var skinsTableView: UITableView!
    var headerTitle = ""
    var weaponData = [Skins]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        skinsTableView.delegate = self
        skinsTableView.dataSource = self
        title = headerTitle
        registerTableViewCells()
        skinsTableView.estimatedRowHeight = 85
        skinsTableView.rowHeight = UITableView.automaticDimension
        removeStandardSkins(weapons: weaponData)
    }
    
    func removeStandardSkins(weapons: [Skins]) {
        let weaponSkinsToRemove = ["luxe knife", "prime guardian", "sovereign guardian", "melee", "standard"]
        let validSkins = weapons.filter { skin in
            guard skin.displayIcon != nil else { return false }
            return weaponSkinsToRemove.allSatisfy { removedSkin in
                return !skin.displayName.lowercased().contains(removedSkin)
            }
        }
        weaponData = validSkins
    }
    
    private func registerTableViewCells() {
        let weaponFieldCell = UINib(nibName: "WeaponCell", bundle: nil)
        self.skinsTableView.register(weaponFieldCell, forCellReuseIdentifier: "WeaponSkinCell")
    }
}

extension WeaponDetailVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
             weaponData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let weaponImage = weaponData[indexPath.row].displayIcon else {
             return UITableViewCell()
        }
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "WeaponSkinCell") as? WeaponCell {
            cell.weaponName.text = weaponData[indexPath.row].displayName
            cell.weaponImage.downloaded(from: weaponImage)
            return cell
        }
        return  UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let image = weaponData[indexPath.row].displayIcon else { return }
        if let weaponSkinVC = storyboard?.instantiateViewController(withIdentifier: "skinVC") as? WeaponSkinImageVC {
            DispatchQueue.main.async {
                weaponSkinVC.skinImageView.downloaded(from: image)
            }
            skinsTableView.deselectRow(at: indexPath, animated: true)
            self.navigationController?.pushViewController(weaponSkinVC, animated: true)
        }
    }
}
