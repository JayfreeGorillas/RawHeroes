import UIKit

class AbilityCell: UITableViewCell {
    
    let abilityNameLabel = UILabel()
    let abilityDescriptionLabel = UILabel()
    let icon = UIImageView()    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(abilityNameLabel)
        contentView.addSubview(abilityDescriptionLabel)
        contentView.addSubview(icon)
        configureAbilityIcon()
        configureAbilityName()
        configureDescriptionLabels()
        setAbilityIconConstraints()
        setNameConstraints()
        setDescriptionConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setup(abilities: AgentAbility) {
        guard let abilityIcon = abilities.displayIcon else { return }
        abilityNameLabel.text = abilities.displayName
        abilityDescriptionLabel.text = abilities.description
        icon.downloaded(from: abilityIcon)
    }
    
// MARK: - Configuring properties
    
    func configureAbilityName() {
        abilityNameLabel.numberOfLines = 0
        abilityNameLabel.adjustsFontSizeToFitWidth = true
        abilityNameLabel.font = .boldSystemFont(ofSize: 20)
        abilityNameLabel.textColor = .white
    }
    
    func configureDescriptionLabels() {
        abilityDescriptionLabel.numberOfLines = 0
        abilityDescriptionLabel.adjustsFontSizeToFitWidth = true
        abilityDescriptionLabel.lineBreakMode = .byWordWrapping
        abilityDescriptionLabel.textColor = .white
    }
    
    func configureAbilityIcon() {
        icon.layer.cornerRadius = 10
        icon.clipsToBounds = true
    }
    
//MARK: - AbilityCellConstraints
    
    func setAbilityIconConstraints() {
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2).isActive = true
        icon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 50).isActive = true
        icon.widthAnchor.constraint(equalTo: icon.heightAnchor , multiplier: 16/9).isActive = true
    }
    
    func setNameConstraints() {
        abilityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        abilityNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2).isActive = true
        abilityNameLabel.bottomAnchor.constraint(equalTo: abilityDescriptionLabel.topAnchor, constant: -2).isActive = true
        abilityNameLabel.leadingAnchor.constraint(equalTo: abilityDescriptionLabel.leadingAnchor).isActive = true
        abilityNameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func setDescriptionConstraints() {
        abilityDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        abilityDescriptionLabel.topAnchor.constraint(equalTo: abilityNameLabel.bottomAnchor, constant: 2).isActive = true
        abilityDescriptionLabel.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 8).isActive = true
        abilityDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        abilityDescriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
    }
}
