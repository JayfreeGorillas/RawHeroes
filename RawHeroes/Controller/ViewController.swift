//
//  ViewController.swift
//  RawHeroes
//
//  Created by Josfry Barillas on 4/6/22.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
 
    
  
    

    var bunchOfTesting = ["testing", "Testing", "123","456","papi"]
//    var agentNamesArr = [AgentData]()
    var agentStore = AgentStore()
    var agentList = [Agent]()
    var agentAbilitiesList: [(String, String)] = []
    var abilityIcons = [URL]()
   
    

    
    @IBOutlet var valorantAgentsCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        valorantAgentsCollectionView.delegate   = self
        valorantAgentsCollectionView.dataSource = self
       // agentManager.fetchAgents()
        agentStore.fetchAgents { (agentResults) in
            switch agentResults {
            case let .success(agentNames):
               self.agentList = agentNames
                
       
                
                DispatchQueue.main.async { [self] in
                   self.agentList = agentNames
                }
                self.valorantAgentsCollectionView.reloadData()
            case let .failure(error):
                print("error fetching shit \(error)")
            }
        }
        valorantAgentsCollectionView.reloadData()
        
    }
    

   
    
    let flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        return layout
    }()
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return agentList.count
    }
    
    func setAgentAbilities(agent: [Agent]) -> [(String, String)] {
        var abilities = [(String, String)]()
        
        for agent in agentList {
       
            let slotOne = (agent.slot1Name, agent.slot1Name)
            let slotTwo = (agent.slot2Name, agent.slot2Description)
            let slotThree = (agent.slot3Name, agent.slot3Description)
            let ultSlot = (agent.slotUltName, agent.slotUltDescription)
            
//            abilities[agent.slot1Name]      = agent.slot1Description
//            abilities[agent.slot2Name]      = agent.slot2Description
//            abilities[agent.slot3Name]      = agent.slot3Description
//            abilities[agent.slotUltName]    = agent.slotUltDescription
            abilities.append(slotOne)
            abilities.append(slotTwo)
            abilities.append(slotThree)
            abilities.append(ultSlot)
            print(abilities)
        }
        print(abilities)
        return abilities
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "heroes", for: indexPath) as! ValorantHeroCell
       // downloadImage(from: agentList[indexPath.row].displayIcon)
        
        cell.heroNameLabel.text = agentList[indexPath.row].displayName
        print(agentList[indexPath.row].displayName)
        print(agentList[indexPath.row].descriptino)
//        print(agentNamesArr[indexPath.row].displayName)
//        print(agentNamesArr[indexPath.row].displayIcon)
//        print(agentNamesArr[indexPath.row].description)
        
        cell.heroImage.downloaded(from: agentList[indexPath.row].displayIcon)
        
        
        
        
        

        cell.heroNameLabel.textColor = .systemOrange
        cell.heroImage.clipsToBounds = true
        cell.heroImage.layer.cornerRadius = cell.heroImage.frame.height / 2
        cell.heroImage.contentMode = .scaleToFill
//        cell.backgroundColor = .gray
      
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = valorantAgentsCollectionView.bounds.width
        let numberOfItemsPerRow: CGFloat = 3
        let spacing: CGFloat = flowLayout.minimumInteritemSpacing
        let availableWidth = width - spacing * (numberOfItemsPerRow + 1)
        let itemDimension = floor(availableWidth / numberOfItemsPerRow)
        return CGSize(width: itemDimension, height: itemDimension)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = valorantAgentsCollectionView.cellForItem(at: indexPath) as! ValorantHeroCell
        let iconList = [UIImage]()
        
        if let detailVC = storyboard?.instantiateViewController(withIdentifier: "detailVC") as? AgentDetailsVC {
            detailVC.agentDescription = agentList[indexPath.row].descriptino
            detailVC.image = cell.heroImage.image!
            detailVC.title = agentList[indexPath.row].displayName
            detailVC.agentUlt = agentList[indexPath.row].slotUltName
            detailVC.agentAbilityThree = agentList[indexPath.row].slot3Name
            detailVC.agentAbilityTwo = agentList[indexPath.row].slot2Name
            detailVC.agentAbilityOne = agentList[indexPath.row].slot1Name
            detailVC.agentAbilityOneDescription = agentList[indexPath.row].slot1Description
            detailVC.agentAbilityTwoDescription = agentList[indexPath.row].slot2Description
            detailVC.agentAbilityThreeDescription = agentList[indexPath.row].slot3Description
            detailVC.agentAbilityUltDescription = agentList[indexPath.row].slotUltDescription
            detailVC.agentAbilitiesList = agentList[indexPath.row].allAgentsAbilities
            
           // detailVC.abilityIcons = agentList[indexPath.row].abilityIcons
            
            

            self.navigationController?.pushViewController(detailVC, animated: true)
        }
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    
   


}

//agentStore.fetchAgents { (agentResults) in
//    switch agentResults {
//    case let .success(agentNames):
//        self.agentNamesArr = agentNames
//
//
//        DispatchQueue.main.async { [self] in
//            self.agentNamesArr = agentNames
//        }
//        self.valorantAgentsCollectionView.reloadData()
//    case let .failure(error):
//        print("error fetching shit \(error)")
//    }
//}




extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        self.contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
                
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
