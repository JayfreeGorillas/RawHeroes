//
//  AgentDetailsVC.swift
//  RawHeroes
//
//  Created by Josfry Barillas on 4/14/22.
//

import UIKit

class AgentDetailsVC: UIViewController {

    @IBOutlet var agentImage: UIImageView!
    @IBOutlet var agentDescriptionLabel: UILabel!
    var tableView = UITableView()
    
    var image = UIImage()
    var agentData = [AgentAbility]()
    var agentDescription = ""
    //var agentAbilityOne = "one"
   // var agentAbilityOneDescription = ""
   // var agentAbilityTwoDescription = ""
   // var agentAbilityThreeDescription = ""
   // var agentAbilityUltDescription = ""
   // var agentAbilityTwo = ""
    //var agentAbilityThree = ""
    //var agentUlt = ""
    //var abilityIcons = [URL]()
    //var agentAbilitiesList: [(URL?,String, String)] = []
    // [(url, string, string)]
    
    
    // have to do this

   
    func configureTableView() {
        view.addSubview(tableView)
        // set the delegate
        setTableViewProtocols()
        // set row height
        
        //tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.rowHeight = 100
        
        
        
        // register cell
        tableView.register(AbilityCell.self, forCellReuseIdentifier: "heroes")
        
        // set constraints
        tableViewConstraints()
    }
    
    func setTableViewProtocols() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    // MARK: - TODO pass all labels and descriptions inside the tableView if possible. not sure how to make it specific per agent yet....
    
    // MARK: - TODO Look into getting the display icon per ability.
    
    // Possibly think about adding a TableView to this view to show all agent abilities.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        agentImage.backgroundColor  = .systemOrange
        agentImage.image = image
        agentDescriptionLabel.text  = agentDescription
        configureTableView()
        tableView.estimatedRowHeight = 85
        tableView.rowHeight = UITableView.automaticDimension

        //print(agentAbilitiesList)
        
    }
}

extension AgentDetailsVC: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return agentData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "heroes") as! AbilityCell
        //cell.heroImage.downloaded(from: agentList[indexPath.row].displayIcon)
        guard let abilityIcon = agentData[indexPath.row].displayIcon else {
            print("no icon here")
           return cell
        }
        cell.icon.downloaded(from: abilityIcon)
        cell.icon.backgroundColor = UIColor(red: 158, green: 218, blue: 246)
        cell.backgroundColor = .systemGray
        cell.abilityNameLabel.textColor = .white
        cell.abilityNameLabel.font = .boldSystemFont(ofSize: 20)
        cell.abilityNameLabel.text = agentData[indexPath.row].displayName
        cell.abilityDescriptionLabel.text = agentData[indexPath.row].description
        cell.abilityDescriptionLabel.textColor = .white


        return cell
        }
    
    func tableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: agentDescriptionLabel.bottomAnchor, constant: 10).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.backgroundColor = .systemGray
        
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


