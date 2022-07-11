//
//  AbilityCell.swift
//  RawHeroes
//
//  Created by Josfry Barillas on 6/28/22.
//

import UIKit

class AbilityCell: UITableViewCell {

    private let abilityNameLabel = UILabel()
    private let abilityDescriptionLabel = UILabel()
    private let icon = UIImageView()
    private let playButton = UIButton()
    
    // add a subviews() in the contentView
    // constraints between all the items
    //NSlayoutConstraint.Activate
    // all the properties get configured at the time cell is created
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(abilityNameLabel)
        contentView.addSubview(abilityDescriptionLabel)
        contentView.addSubview(icon)
        contentView.addSubview(playButton)
        print("mommmaaa")
        
        
        
        
        
        

        
  
        // add subviews
        //constraints
        abilityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        abilityDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        icon.translatesAutoresizingMaskIntoConstraints = false
        playButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            abilityNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            abilityNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        //layout
    }
    
   
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
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
