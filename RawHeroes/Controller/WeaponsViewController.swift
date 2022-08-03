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

        weaponTableView.delegate = self
        weaponTableView.dataSource = self
        
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
    }
 

}
//MARK: todo - change tableViewTo Programattic

extension WeaponsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        weaponList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "weaponCell")
        cell.textLabel?.text = weaponList[indexPath.row].displayName
        cell.imageView?.downloaded(from: weaponList[indexPath.row].displayIcon)
        
        return cell
    }
    
    
}
