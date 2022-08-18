import UIKit

class AgentDetailsVC: UIViewController {
    
    @IBOutlet var agentImage: UIImageView!
    @IBOutlet var agentDescriptionLabel: UILabel!
    var tableView = UITableView()
    var image = UIImage()
    var agent = [Agent]()
    var agentData = [AgentAbility]()
    var agentDescription = ""
    
    
    func configureTableView() {
        view.addSubview(tableView) // set the delegate
        setTableViewProtocols()   // set row height
        tableView.rowHeight = 100
        tableView.register(AgentDetailCell.self, forCellReuseIdentifier: "agentDetail")
        tableView.register(AbilityCell.self, forCellReuseIdentifier: "heroes") // register cell
        tableView.backgroundColor = UIColor(red: 28, green: 28, blue: 30)
        tableViewConstraints() // set constraints
    }
    
    func setTableViewProtocols() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        removePassives(abilities: agentData)
        configureTableView()
        tableView.estimatedRowHeight = 85
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = UIColor(red: 28, green: 28, blue: 30)
        
    }
    
    func removePassives(abilities: [AgentAbility]) {
        var validAbilities = [AgentAbility]()
        for ability in abilities {
            if ability.displayIcon != nil {
                validAbilities.append(ability)
            } else {
                print("\(ability.description)")
            }
        }
        agentData = validAbilities
    }
}
// MARK: TODO CREATE A CUSTOM CELL FOR AGENT
extension AgentDetailsVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) {
            return 1
        } else if (section == 1) || (section == 2) {
            return agentData.count
        }
        return agentData.count
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let agentCell = tableView.dequeueReusableCell(withIdentifier: "agentDetail") as! AgentDetailCell
            agentCell.agentDescriptionLabel.text = agentDescription
            agentCell.agentImage.image = image
            agentCell.backgroundColor = UIColor(red: 28, green: 28, blue: 30)
            agentCell.selectionStyle = .none
            return agentCell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "heroes") as! AbilityCell
            cell.setup(abilities: agentData[indexPath.row])
            cell.backgroundColor = UIColor(red: 28, green: 28, blue: 30)
            cell.icon.backgroundColor = UIColor(red: 218, green: 60, blue: 32)
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}


