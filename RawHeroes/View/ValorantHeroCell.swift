import UIKit

class ValorantHeroCell: UICollectionViewCell {
    
    @IBOutlet var heroImage: UIImageView!
    @IBOutlet var heroNameLabel: UILabel!
    var heroPortrait = UIImageView()
    
    func setup(agent: Agent) {
        guard let fullPortrait = agent.fullPortraitV2 else { return }
        heroImage.downloaded(from: agent.displayIcon)
        heroNameLabel.text = agent.displayName
        heroPortrait.downloaded(from: fullPortrait)
    } 
}
