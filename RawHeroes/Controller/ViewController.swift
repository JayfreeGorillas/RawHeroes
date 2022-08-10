import UIKit

enum AgentStyle: Hashable, CaseIterable {
    case duelist
    case initiator
    case controller
    case sentinel
}

let agents = [Agent]() // All agent data
let agentsByStyle = agents.reduce(into: [AgentStyle: [Agent]]()) { accumulator, nextAgent in
    accumulator[nextAgent.style, default: []].append(nextAgent)
}

var currentAgentStyle: AgentStyle

class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var bunchOfTesting = ["testing", "Testing", "123","456","papi"]
    var agentStore = AgentStore()
    var agentList = [Agent]()
    var fullListOfAgents = [Agent]()
    var filteredAgents = [Agent]()
    var abilityIcons = [URL]()
    var duelistFiltered = false
    var initiatorFiltered = false
    var controllerFiltered = false
    var sentinelFiltered = false
    
    @IBOutlet var valorantAgentsCollectionView: UICollectionView!
        
    
    @IBAction func chooseRole(_ sender: UIBarButtonItem) {
        
        if sender.tag == 0 && duelistFiltered  {
            duelistFiltered.toggle() // turning off the filter on duelist
            filteredAgents = []
            agentList = fullListOfAgents
            valorantAgentsCollectionView.reloadData()
        } else if sender.tag == 0 && duelistFiltered == false {
  
            agentList.filter { agent in
                guard agent.role?.displayName == sender.title else { return false }
               filteredAgents.append(agent)
                return true
            }
            
            duelistFiltered.toggle()
            sender.isSelected
            agentList = filteredAgents
            valorantAgentsCollectionView.reloadData()
            
            print(sender.tag)
            print(sender.title)
        } else if sender.tag == 1 && initiatorFiltered {
            initiatorFiltered.toggle()

            agentList = fullListOfAgents
            valorantAgentsCollectionView.reloadData()
            print(sender.tag)
            print(sender.title)
        } else if sender.tag == 1 && initiatorFiltered == false {
            
            fullListOfAgents.filter { agent in
                guard agent.role?.displayName == sender.title else { return false }
                
                if filteredAgents.count > 0 && duelistFiltered {
                    filteredAgents.append(agent)
                    return true
                }
                filteredAgents.append(agent)
                return true
            }
            
            initiatorFiltered.toggle()
            agentList = filteredAgents
            valorantAgentsCollectionView.reloadData()
            print(sender.tag)
            print(sender.title)
        }
    }
    //    @IBAction func ChooseRoleAction(_ UIButton: Any) {
//        print(sender)
//        var isFilterOn: Bool = false
//
//
//    }
    
//    func filterAgentsByRole(buttonTag: Int) {
//        var filteredList = [Agent]()
//        if buttonTag == 0 {
//            agentList.filter { agent in
//                if agent.role?
//            }
//        }
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        valorantAgentsCollectionView.delegate   = self
        valorantAgentsCollectionView.dataSource = self
        agentStore.fetchAgents { (agentResults) in
            switch agentResults {
            case let .success(agentNames):
                
                DispatchQueue.main.async {  [self] in
                    self.agentList = agentNames
                    self.fullListOfAgents = self.agentList.filter(\.isPlayableCharacter)
                    self.agentList = self.agentList.filter(\.isPlayableCharacter)
                    self.valorantAgentsCollectionView.reloadData()
                }
            case let .failure(error):
                print("error fetching \(error)")
            }
        }
        valorantAgentsCollectionView.reloadData()
        fullListOfAgents = agentList
    }
    
    
    func filterPlayableAgents(agents: [Agent]) {
        let filteredAgents = agents.filter(\.isPlayableCharacter)
        
        agentList = filteredAgents
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
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "heroes", for: indexPath) as! ValorantHeroCell
        cell.heroPortrait.downloaded(from: agentList[indexPath.row].fullPortraitV2!)
        cell.heroNameLabel.text = agentList[indexPath.row].displayName
        cell.heroImage.downloaded(from: agentList[indexPath.row].displayIcon)
        cell.heroNameLabel.textColor = .white
        cell.heroImage.clipsToBounds = true
        cell.heroImage.layer.cornerRadius = cell.heroImage.frame.height / 2
        cell.heroImage.contentMode = .scaleToFill
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
        if let detailVC = storyboard?.instantiateViewController(withIdentifier: "detailVC") as? AgentDetailsVC {
            detailVC.agentDescription = agentList[indexPath.row].description
            detailVC.image = cell.heroPortrait.image!
            detailVC.title = agentList[indexPath.row].displayName
            detailVC.agentData = agentList[indexPath.row].abilities
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}




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
