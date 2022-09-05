import UIKit

class AgentsViewController: UICollectionViewController {
    
    var agentStore = AgentStore()
    var agentList = [Agent]()
    let flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        return layout
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    func fetchData() {
        agentStore.fetchAgents { (agentResults) in
            switch agentResults {
            case let .success(agentNames):
                DispatchQueue.main.async {  [weak self] in
                    self?.agentList = agentNames.filter(\.isPlayableCharacter)
                    self?.collectionView.reloadData()
                }
            case let .failure(error):
                print("error fetching \(error)")
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        agentList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "heroes", for: indexPath) as? ValorantHeroCell else {
            assertionFailure("valorant hero cell should not be nil")
            return UICollectionViewCell()
        }
        cell.setup(agent: agentList[indexPath.item])
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! ValorantHeroCell
        if let detailVC = storyboard?.instantiateViewController(withIdentifier: "detailVC") as? AgentDetailsVC {
            detailVC.agentDescription = agentList[indexPath.row].description
            // make an on an image optional
            detailVC.image = cell.heroPortrait.image!
            detailVC.title = agentList[indexPath.row].displayName
            detailVC.agentData = agentList[indexPath.row].abilities
            detailVC.agent = [agentList[indexPath.row]]
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
// MARK: - extension of UICollectionViewDelegateFlowLayout

extension AgentsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let numberOfItemsPerRow: CGFloat = 3
        let spacing: CGFloat = flowLayout.minimumInteritemSpacing
        let availableWidth = width - spacing * (numberOfItemsPerRow + 1)
        let itemDimension = floor(availableWidth / numberOfItemsPerRow)
        return CGSize(width: itemDimension, height: itemDimension)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        1
    }
}
// MARK: -
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
