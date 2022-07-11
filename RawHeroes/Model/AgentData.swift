//
//  AgentData.swift
//  RawHeroes
//
//  Created by Josfry Barillas on 4/7/22.
//

import Foundation

struct AllData: Decodable {
    let data: [AgentData]
    
}

struct AgentData: Codable, Equatable {
    let displayName: String
    let description: String
    let displayIcon: URL
   // let fullPortraitV2: URL
    //let role: AgentRole
    let abilities: [AgentAbilities]
    //extend this to get more data
}

struct AgentRole: Codable, Equatable {
    let displayName: String
}


struct AgentAbilities: Codable, Equatable {
    let slot: String
    let displayName: String
    let description: String
}


// data[0].role.displayName data[0].abilities[0].slot


