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
    var abilityIcons = [URL]()
    var agentAbilitiesList: [(URL?,String, String)] = []
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
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = 300
        print(agentAbilitiesList)
    }
}

extension AgentDetailsVC: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return agentAbilitiesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        var cell = tableView.dequeueReusableCell(withIdentifier: "heroes") as! AbilityCell
        
//        print(agentAbilitiesList[indexPath.row].0)
        //cell.icon.downloaded(from: agentAbilitiesList[indexPath.row].0)
        cell.abilityNameLabel.text = agentAbilitiesList[indexPath.row].1
        cell.abilityDescriptionLabel.text = agentAbilitiesList[indexPath.row].2
        cell.playButton.backgroundColor = .darkGray
        

        return cell
        }
    
    func tableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: agentDescriptionLabel.bottomAnchor, constant: 10).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}


