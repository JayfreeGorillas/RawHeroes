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
     let playButton = UIButton()
    
    // add a subviews() in the contentView
    // constraints between all the items
    //NSlayoutConstraint.Activate
    // all the properties get configured at the time cell is created
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(abilityNameLabel)
        addSubview(abilityDescriptionLabel)
        configureAbilityName()
        configureDescriptionLabels()
        setNameConstraints()
        setDescriptionConstraints()
    }
   
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configureAbilityName() {
        abilityNameLabel.numberOfLines = 0
        abilityNameLabel.adjustsFontSizeToFitWidth = true
    }
    
    func configureDescriptionLabels() {
        
        abilityDescriptionLabel.numberOfLines = 0
        abilityDescriptionLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setNameConstraints() {
        abilityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        abilityNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        abilityNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        abilityNameLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        abilityNameLabel.widthAnchor.constraint(equalTo: abilityNameLabel.heightAnchor).isActive = true
    }
    
    func setDescriptionConstraints() {
        abilityDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        abilityDescriptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        abilityDescriptionLabel.leadingAnchor.constraint(equalTo: abilityNameLabel.trailingAnchor, constant: 10).isActive = true
        abilityDescriptionLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        abilityDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
}


//class Dog {
//    let breed: String
//    let dogFood: String
//    let food: String
//    let age: Int
//
//    init(breed: String, dogFood: String, food: String, age: Int) {
//        self.breed = breed
//        self.dogFood = dogFood
//        self.food = food
//        self.age = age
//    }
//
//    init(){
//        self.breed = ""
//        self.age = 1
//        self.dogFood = ""
//        self.food = ""
//    }
//}
//
//var puppy = Dog(breed: "goldenDoodle", dogFood: "hills", food: "meatball", age: 1)
//var puppy = Dog()
//
////puppy.food = "dogFood"
////puppy.age = 4
////puppy.breed = "turtle"
////puppy.dogFood = "hills"
