import UIKit

class WeaponsViewController: UIViewController {
    
    var weaponStore = WeaponStore()
    var weaponList = [Weapon]()
    @IBOutlet var weaponTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weaponTableView.delegate = self
        weaponTableView.dataSource = self
        registerTableViewCells()
        weaponTableView.estimatedRowHeight = 85
        weaponTableView.rowHeight = UITableView.automaticDimension
        fetchWeapons()
    }
    
    func fetchWeapons() {
        weaponStore.fetchWeapons { [weak self] (weaponResults) in
            guard let self = self else { return }
            switch weaponResults {
            case let .success(weaponNames):
                DispatchQueue.main.async {
                    self.weaponList = weaponNames
                    self.weaponTableView.reloadData()
                }
            case let .failure(error):
                print("error fetching \(error)")
            }
        }
    }
    
    private func registerTableViewCells() {
        let weaponFieldCell = UINib(nibName: "WeaponCell", bundle: nil)
        self.weaponTableView.register(weaponFieldCell, forCellReuseIdentifier: "WeaponCell")
    }
}

extension WeaponsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       weaponList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "WeaponCell") as? WeaponCell {
            cell.setupWeapons(weapon: weaponList[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let weaponDetailVC = storyboard?.instantiateViewController(withIdentifier: "weaponDetailVC") as? WeaponDetailVC {
            weaponDetailVC.weaponData = weaponList[indexPath.row].skins
            weaponDetailVC.headerTitle = weaponList[indexPath.row].displayName
            self.navigationController?.pushViewController(weaponDetailVC, animated: true)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
