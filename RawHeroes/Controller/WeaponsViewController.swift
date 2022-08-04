//
//  WeaponsViewController.swift
//  RawHeroes
//
//  Created by Josfry Barillas on 8/2/22.
//

import UIKit

class WeaponsViewController: UIViewController {

    var weaponStore = WeaponStore()
    var weaponList = [Weapon]()
    
    @IBOutlet var weaponTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.weaponTableView.delegate = self
        self.weaponTableView.dataSource = self
        self.registerTableViewCells()
        weaponTableView.estimatedRowHeight = 85
        weaponTableView.rowHeight = UITableView.automaticDimension
        
        weaponStore.fetchWeapons { (weaponResults) in
            switch weaponResults {
            case let .success(weaponNames):
                self.weaponList = weaponNames
                // add dispatch que to update ui
                
                DispatchQueue.main.async { [self] in
                    self.weaponList = weaponNames
                    
                }
                self.weaponTableView.reloadData()
                print(self.weaponList)
            case let .failure(error):
                print("error fetching shit \(error)")
            }
        }
//
    }
 

   
    private func registerTableViewCells() {
        let weaponFieldCell = UINib(nibName: "WeaponCell", bundle: nil)
        self.weaponTableView.register(weaponFieldCell, forCellReuseIdentifier: "WeaponCell")
    }
}
//MARK: todo - change tableViewTo Programattic

extension WeaponsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        weaponList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: .default, reuseIdentifier: "weaponCell")
        if let cell = tableView.dequeueReusableCell(withIdentifier: "WeaponCell") as? WeaponCell {
            cell.weaponImage.downloaded(from: weaponList[indexPath.row].displayIcon)
            cell.weaponName.text = weaponList[indexPath.row].displayName
            return cell
        }
        
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = weaponTableView.cellForRow(at: indexPath) as! WeaponCell
        
        if let weaponDetailVC = storyboard?.instantiateViewController(withIdentifier: "weaponDetailVC") as? WeaponDetailVC {
            weaponDetailVC.weaponData = weaponList[indexPath.row].skins
            self.navigationController?.pushViewController(weaponDetailVC, animated: true)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
