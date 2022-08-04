//
//  WeaponDetailVC.swift
//  RawHeroes
//
//  Created by Josfry Barillas on 8/3/22.
//

import UIKit

class WeaponDetailVC: UIViewController {
    
    @IBOutlet var skinsTableView: UITableView!
    
    var weaponData = [Skins]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        skinsTableView.delegate = self
        skinsTableView.dataSource = self
        
        registerTableViewCells()
        skinsTableView.estimatedRowHeight = 85
        skinsTableView.rowHeight = UITableView.automaticDimension
        removeStandardSkins(weapons: weaponData)
        // Do any additional setup after loading the view.
    }
    
    func removeStandardSkins(weapons: [Skins]) -> [Skins] {
        var skins = [Skins]()
        for skin in weaponData {
            if skin.displayName.contains("Standard") {
                print(skin.displayName)
            } else if skin.displayIcon == nil {
                print(skin)
            } else {
                skins.append(skin)
            }
        }
        print(skins)
        weaponData = skins
        return weaponData
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
        
      
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = skinsTableView.cellForRow(at: indexPath) as? WeaponCell
        skinsTableView.deselectRow(at: indexPath, animated: true)
        print(cell)
    }
     
    
}
