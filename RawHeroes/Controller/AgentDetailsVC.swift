//
//  AgentDetailsVC.swift
//  RawHeroes
//
//  Created by Josfry Barillas on 4/14/22.
//

import UIKit

class AgentDetailsVC: UIViewController {

    @IBOutlet var agentImage: UIImageView!
    @IBOutlet var agentAbilitiesTV: UITableView!
    @IBOutlet var agentDescriptionLabel: UILabel!
    
    var agentDeets = ViewController()
    
    var image = UIImage()
    var agentDescription = ""
    var agentAbilityOne = "one"
    var agentAbilityOneDescription = ""
    var agentAbilityTwoDescription = ""
    var agentAbilityThreeDescription = ""
    var agentAbilityUltDescription = ""
    var agentAbilityTwo = ""
    var agentAbilityThree = ""
    var agentUlt = ""
    var abilityImage = UIImage()
    var agentAbilities: [(String,String)] = []
    //String/URL add to tuple
    var agentAbilityDescriptions: [String] = []
    var agentAbilitiesDict = [String: String]()
    
    // have to do this
    func addToAbilityArray() {
        agentAbilities.append((agentAbilityOne, agentAbilityOneDescription))
        agentAbilities.append((agentAbilityTwo, agentAbilityTwoDescription))
        agentAbilities.append((agentAbilityThree,agentAbilityThreeDescription))
        agentAbilities.append((agentUlt, agentAbilityUltDescription))
    }
    
    func addToDescriptionArray() {
        agentAbilityDescriptions.append(agentAbilityOneDescription)
        agentAbilityDescriptions.append(agentAbilityTwoDescription)
        agentAbilityDescriptions.append(agentAbilityThreeDescription)
        agentAbilityDescriptions.append(agentAbilityUltDescription)
    }
    
    func addToAgentDict() {
        agentAbilitiesDict[agentAbilityOne] = agentAbilityOneDescription
        agentAbilitiesDict[agentAbilityTwo] = agentAbilityTwoDescription
        agentAbilitiesDict[agentAbilityThree] = agentAbilityThreeDescription
        agentAbilitiesDict[agentUlt] = agentAbilityUltDescription
    }
   
    
    // MARK: - TODO pass all labels and descriptions inside the tableView if possible. not sure how to make it specific per agent yet....
    
    // MARK: - TODO Look into getting the display icon per ability.
    
    // Possibly think about adding a TableView to this view to show all agent abilities.
    override func viewDidLoad() {
        super.viewDidLoad()
        addToAbilityArray()
        addToDescriptionArray()
        addToAgentDict()
//        agentAbilitiesTV.register(AgentAbilitiesCell.nib(), forCellReuseIdentifier: AgentAbilitiesCell.identifier)
        agentImage.backgroundColor  = .systemOrange
        agentImage.image = image
        agentDescriptionLabel.text  = agentDescription
        agentAbilitiesTV.dataSource = self
        agentAbilitiesTV.delegate   = self
        
        agentAbilitiesTV.register(AbilityCell.self, forCellReuseIdentifier: "cell")
    }
    



}

extension AgentDetailsVC: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return agentAbilities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? AbilityCell
        if cell == nil {
//            cell = AbilityCell( style: , reuseIdentifier: "cell")
//            cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
        }
        
        // use cells from ability cell
        cell?.textLabel?.text = "\(agentAbilities[indexPath.row].0)"
        cell?.detailTextLabel?.text = "\(agentAbilities[indexPath.row].1)"
        
        print(agentAbilitiesDict[agentAbilityOne])
        print(agentAbilities[indexPath.row].0)
        print(agentAbilities[indexPath.row].1)
        print(agentAbilityDescriptions[indexPath.row])
        return cell!
        }
        
  
        
        

    
    
}
