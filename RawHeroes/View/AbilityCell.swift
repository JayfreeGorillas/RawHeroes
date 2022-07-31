//
//  AbilityCell.swift
//  RawHeroes
//
//  Created by Josfry Barillas on 6/28/22.
//

import UIKit

class AbilityCell: UITableViewCell {

     let abilityNameLabel = UILabel()
     let abilityDescriptionLabel = UILabel()
     let icon = UIImageView()
     //let playButton = UIButton()
    
    // add a subviews() in the contentView
    // constraints between all the items
    //NSlayoutConstraint.Activate
    // all the properties get configured at the time cell is created
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(abilityNameLabel)
        contentView.addSubview(abilityDescriptionLabel)
        contentView.addSubview(icon)
        //contentView.addSubview(playButton)
        
        configureAbilityIcon()
        configureAbilityName()
        configureDescriptionLabels()
        //configureButton()
        
        setAbilityIconConstraints()
        setNameConstraints()
        setDescriptionConstraints()
        //setButtonConstraints()
    }
   
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configureAbilityName() {
        //abilityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        abilityNameLabel.numberOfLines = 0
        abilityNameLabel.adjustsFontSizeToFitWidth = true
        //abilityNameLabel.lineBreakMode = .byWordWrapping
        
    }
    
    func configureDescriptionLabels() {
      //  abilityDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        abilityDescriptionLabel.numberOfLines = 0
        abilityDescriptionLabel.adjustsFontSizeToFitWidth = true
        abilityDescriptionLabel.lineBreakMode = .byWordWrapping
    }
    
    func configureAbilityIcon() {
        icon.layer.cornerRadius = 10
        icon.clipsToBounds = true
    }
    
//    func configureButton() {
//        playButton.layer.cornerRadius = 10
//        playButton.clipsToBounds = true
//    }
  
    func setAbilityIconConstraints() {
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        icon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 40).isActive = true
        icon.widthAnchor.constraint(equalTo: icon.heightAnchor , multiplier: 16/9).isActive = true
        
    }
    
    func setNameConstraints() {
        abilityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        //abilityNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        abilityNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2).isActive = true
        abilityNameLabel.bottomAnchor.constraint(equalTo: abilityDescriptionLabel.topAnchor, constant: -2).isActive = true
        abilityNameLabel.leadingAnchor.constraint(equalTo: abilityDescriptionLabel.leadingAnchor).isActive = true
        abilityNameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        //abilityNameLabel.widthAnchor.constraint(equalTo: abilityNameLabel.heightAnchor).isActive = true
    }
    
    func setDescriptionConstraints() {
        abilityDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
//        abilityDescriptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        abilityDescriptionLabel.topAnchor.constraint(equalTo: abilityNameLabel.bottomAnchor, constant: 2).isActive = true
        abilityDescriptionLabel.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 8).isActive = true
        abilityDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
      //  abilityDescriptionLabel.heightAnchor.constraint(equalToConstant: 70).isActive = true
        abilityDescriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

    }
    
//    func setButtonConstraints() {
//        playButton.translatesAutoresizingMaskIntoConstraints = false
//        playButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        playButton.leadingAnchor.constraint(equalTo: abilityDescriptionLabel.trailingAnchor, constant: 8).isActive = true
//        playButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
//        playButton.widthAnchor.constraint(equalTo: playButton.heightAnchor, multiplier: 16/9).isActive = true
//        playButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
//    }
    
}
